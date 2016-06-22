class ChangePriceLimitInCommissions < ActiveRecord::Migration
  def change
  	change_column :commissions, :min_price, :decimal, precision: 14, scale: 2
  	change_column :commissions, :max_price, :decimal, precision: 14, scale: 2
  end
end
