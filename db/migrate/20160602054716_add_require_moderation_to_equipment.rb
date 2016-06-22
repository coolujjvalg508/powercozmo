class AddRequireModerationToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :require_moderation, :integer, default: 0
  end
end
