FactoryBot.define do
  factory :item do
    name                       {"カカカッカか"}
    explanation                 {"あカッカか"}
    category_id                 {2}
    products_information_id     {2}
    bo_shipping_charge_id       {3}
    area_id                      {2}
    estimated_shopping_date_id    {2}
    price                          {1111}
    association :user             

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/arrow_top (2).png'), filename: 'arrow_top (2).png')
    end
  end
end
