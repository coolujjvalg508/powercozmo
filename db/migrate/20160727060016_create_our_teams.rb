class CreateOurTeams < ActiveRecord::Migration
  def change
    create_table :our_teams do |t|
      t.string :name
      t.string :description
      t.boolean  :active,                 default: true,         null: false

      t.timestamps null: false
    end
  end
end
