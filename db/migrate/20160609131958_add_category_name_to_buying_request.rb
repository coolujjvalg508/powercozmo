class AddCategoryNameToBuyingRequest < ActiveRecord::Migration
  def change
    add_column :buying_requests, :category_name, :string
  end
end
