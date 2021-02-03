class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :area_id
      t.string :city
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
