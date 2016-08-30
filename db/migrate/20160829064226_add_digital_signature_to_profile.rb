class AddDigitalSignatureToProfile < ActiveRecord::Migration
  def change
	add_column :profiles, :digital_signature, :text
  end
end
