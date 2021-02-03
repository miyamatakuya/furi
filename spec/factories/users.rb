FactoryBot.define do
  factory :user do
    nickname              {"tanaka"}
    email                 {Faker::Internet.email}
    password              {"tanaka4235"}
    password_confirmation {password}
    first_name_kana       {"タロウ"}
    last_name_kana         {"タナカ"}
    first_name             {"太朗"}
    last_name              {"田中"}
    birthday              {"1937-05-04"}
  end
end