class CreateEnquiryResponses < ActiveRecord::Migration
  def change
    create_table :enquiry_responses do |t|
      t.belongs_to :equipment_enquiry, index: true
      t.text :message
      t.integer :status, default: 1
      t.boolean :is_read, default: false
      t.belongs_to :user, index: true
      t.integer :forwarded_by

      t.timestamps null: false
    end
  end
end
