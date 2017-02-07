class AddDescriptionFaultPdfAttachmentToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :pdf_attachment, :string
  end
end
