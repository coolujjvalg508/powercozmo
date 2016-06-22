class ChangeColumnTypeToStaticPages < ActiveRecord::Migration
  def change
  	change_column :static_pages, :content, :text, :limit => 4294967295
  end
end
