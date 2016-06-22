class AddAttachmentToBuyingProposals < ActiveRecord::Migration
  def change
    add_column :buying_proposals, :attachment, :string
  end
end
