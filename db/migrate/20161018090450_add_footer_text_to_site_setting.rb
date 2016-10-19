class AddFooterTextToSiteSetting < ActiveRecord::Migration
  def change
	add_column :site_settings, :footer_text, :string, :limit => 500
  end
end
