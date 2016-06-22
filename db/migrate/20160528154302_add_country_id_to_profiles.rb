class AddCountryIdToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :country_id, :integer
  end
end
