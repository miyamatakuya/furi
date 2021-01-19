class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :products_information_id
      t.integer :bo_shipping_charge_id
      t.integer :area_id
      t.integer :estimated_shopping_date_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
