class PromoLinkInquiry < ActiveRecord::Migration
  def up
    add_column :refinery_promotions, :url, :text
    add_column :refinery_inquiries_inquiries, :category, :string
  end

  def down
    remove_column :refinery_promotions, :url
    remove_column :refinery_inquiries_inquiries, :category
  end
end
