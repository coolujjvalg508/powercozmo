class AddHomePageTextToSiteSetting < ActiveRecord::Migration  
  def change
	add_column :site_settings, :homepage_heading, :string
    add_column :site_settings, :homepage_text, :string, :limit => 500
    add_column :site_settings, :homepage_search_text, :string, :limit => 500
  end
end
