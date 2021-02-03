class UserFurima
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :token
  with_options presence: true do
    validates :postal_code, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id,numericality:{ other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, length:{ maximum: 11, message: "is invalid. " }
    validates :user_id
    validates :item_id
    validates :token
  end

 
  
    def save
     
      order = Order.create(item_id: item_id, user_id: user_id)

      Address.create(postal_code: postal_code, area_id: area_id, city: city,  address: address, building_name: building_name, phone_number: phone_number, order_id: order.id )
      
    end
  end