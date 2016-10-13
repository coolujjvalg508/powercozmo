class AddNewsletterTypeToSentNewsletter < ActiveRecord::Migration
  def change
	add_column :sent_newsletters, :newsletter_type, :string
  end
end
