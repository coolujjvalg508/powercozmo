class AddFieldsToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :telephone, :string
  	add_column :profiles, :job_title, :string
  	add_column :profiles, :company_address, :string, :limit => 500
  	add_column :profiles, :company_telephone, :string
  	add_column :profiles, :business_type, :string
  end
end
