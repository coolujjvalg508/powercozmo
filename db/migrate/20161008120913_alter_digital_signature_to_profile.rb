class AlterDigitalSignatureToProfile < ActiveRecord::Migration
	def change
			change_column :profiles, :digital_signature, :longtext
	end
end
