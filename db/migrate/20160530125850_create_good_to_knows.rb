class CreateGoodToKnows < ActiveRecord::Migration
  def change
    create_table :good_to_knows do |t|
      t.text :question
      t.text :answer
      t.boolean :active,     default: true, null: false
	    t.integer :position
	    t.string :name

      t.timestamps null: false
    end
  end
end
