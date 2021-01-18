class Item < ApplicationRecord
belongs_to :user
has_one_attached :image
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :bo_shipping_charge
  belongs_to_active_hash :category
  belongs_to_active_hash :estimated_shopping_date
  belongs_to_active_hash :products_information

  with_options presence: true do
  validates :image
  validates :name
  validates :explanation
  validates :price
  validates :price,numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
 end

 with_options numericality:{other_than: 1} do
  validates :category_id
  validates :products_information_id
  validates :bo_shipping_charges_id
  validates :area_id
  validates :estimated_shopping_date_id
 end

 

end
