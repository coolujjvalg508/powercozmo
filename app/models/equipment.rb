class Equipment < ActiveRecord::Base
  attr_accessor :sub_cat_id
  just_define_datetime_picker :availble_for
  ############## scopes ############
  scope :not_inactive, -> { where.not(status: 'inactive') }
  #below fetching active and in progress equipmnts as per current enum
  scope :available_for_purchase, -> { where(status: [1, 4]) }
	########### Default per page  value for pagination ####
	paginates_per 12
	############# Associations ########################
	belongs_to :country
	belongs_to :manufacturer
	belongs_to :category
	belongs_to :sub_category, :class_name => "Category", :foreign_key => "sub_category_id"
  belongs_to :sub_sub_category, :class_name => "Category", :foreign_key => "sub_sub_category_id"
  belongs_to :user
  has_many :equipment_enquiries, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? || attributes['image'].nil? }, allow_destroy: true

  def sub_cat_id
    self.sub_category_id
  end
  ############ enum and constants ###################
  ## Equipmment Status ###
  # Active: this status will appear during the lifetime of post.
  # Closed: This status will appear after the end of post lifetime.
  # Inactive: This status will appear in case of deactivate the post from admin or from seller.
  # Sold: This status will appear after equipment sold out.
  # In progress: This status will appear once seller get buying order or if seller accept the bids (offer) till the time we finish the deal.
  enum status: { 'inactive' => 0, 'active' => 1, 'closed' => 2, 'sold' => 3, 'in_progress' => 4 }

  enum equipment_type: {'equipment' => 'equipment', 'power_plant' => 'power_plant'}
  CONDITION_TYPES = %w(New Surplus Used Refurbished)
  POWER_PLANT_TYPES = ['steam','gas','diesel gen','solar','wind']
  ############# Server Validations ####################
  validates :name, :category_id, :city, :country_id, :price, :currency, :description, :availble_for,:equipment_type, presence: true
  validates :equipment_model, :condition, :manufacture_year, presence: true, if: "equipment_type == 'equipment'"
  validates :power_plant_type, :power_plant_age, :turbine_model, :turbine_manufacturer_name, presence: true, if: "equipment_type == 'power_plant'"
  validates :power_plant_type, :inclusion => { :in => POWER_PLANT_TYPES }, if: "equipment_type == 'power_plant' && power_plant_type.present?"
  validates :identifier, uniqueness: true, :if => "identifier.present?"
  validates :identifier, :format => { :with => /\A^[\w\-]+\z/i,
    :message => "can only contain letters and numbers." }, if: "identifier.present?"
  validates :price, numericality: { :greater_than_or_equal_to => 0.1, message: "can only be numerics" }
  validates_format_of :price, :with  => /\A[0-9]{0,10}[\.]*[0-9]{0,2}\z/, :message => "can't be more then 9999999999.99"
  validates :condition, :inclusion => { :in => CONDITION_TYPES }, if: "equipment_type == 'equipment'"
  validate :availble_for_cannot_be_in_the_past
	validates_associated :images
  validates :city, :format => { :with => /\A[a-zA-z\s-]+\z/,
    :message => "is not valid." }, if: "city.present?"

  ############## Call Backs ###########################
  after_initialize :next_identifier, unless: :persisted?
  around_save :check_moderation_status
  after_create :send_equipment_mail_to_seller
  
  
  ######## Solr search Start ########
    
	searchable do
			 
		text :name
		text :identifier
		text :description
		integer :id
		integer :manufacture_year
		integer :manufacturer_id
		integer :country_id
		integer :category_id
		integer :sub_category_id
		integer :sub_sub_category_id
		
		integer :status
		time :created_at
		
		join(:name, :prefix => "country", :target => Country, :type => :text, :join => { :from => :id, :to => :country_id })
		join(:name, :prefix => "manufacturer", :target => Manufacturer, :type => :text, :join => { :from => :id, :to => :manufacturer_id })
		
		join(:name, :prefix => "category", :target => Category, :type => :text, :join => { :from => :id, :to => :category_id })
		join(:name, :prefix => "sub_category", :target => Category, :type => :text, :join => { :from => :id, :to => :sub_category_id })
		join(:name, :prefix => "sub_sub_category", :target => Category, :type => :text, :join => { :from => :id, :to => :sub_sub_category_id })
		
	end
  
  ######## Solr search End ##########

  def check_moderation_status
    moderation_required = self.require_moderation
    changed_status = self.status
    self.require_moderation = false if (changed_status == "active" || changed_status == "1")
    yield
    if moderation_required == 1 && (changed_status == 'active') # if moderation required was true before update
      EquipmentMailer.delay.custom_category_equipment_activated(self.user.email, self.name)
    end
  end

  def availble_for_cannot_be_in_the_past
    if availble_for.present? && availble_for < Time.now
      errors.add(:availble_for, "can't be in the past")
    end
  end

  def next_identifier
    e = Equipment.last
    self.identifier = e.nil? ? 'ITEM-0000001' : e.identifier.to_s.succ
  end

  def self.popular
    select("equipment.*, count(equipment_enquiries.id) AS equipment_enquiries_count").
    joins("LEFT OUTER JOIN equipment_enquiries ON equipment_enquiries.equipment_id = equipment.id").
    group("equipment.id").
    order("equipment_enquiries_count DESC, equipment.rating DESC").active
  end

  def self.random
    Equipment.active.order("RAND()")
  end

  def expired?
    availble_for < Time.now
  end

  def send_equipment_mail_to_seller
    EquipmentMailer.delay.send_equipment_creation_notification(self)
  end

  def send_post_expired_email_to_seller
    EquipmentMailer.delay.send_post_expired_email_to_seller(self) if active? && expired?
  end
  
  private

  def update_manufacture_year
  	self.update_attribute(:manufacture_year, self.created_at.to_date.year) if self.created_at.present? && self.manufacture_year.nil?
  end
end
