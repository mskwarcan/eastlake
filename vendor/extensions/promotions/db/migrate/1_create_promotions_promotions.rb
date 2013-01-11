class CreatePromotionsPromotions < ActiveRecord::Migration

  def up
    create_table :refinery_promotions do |t|
      t.string :title
      t.integer :promotion_id
      t.boolean :active
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-promotions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/promotions/promotions"})
    end

    drop_table :refinery_promotions

  end

end
