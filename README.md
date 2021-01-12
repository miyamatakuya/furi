## users テーブル

| Column             | Type   | Options     |
| --------           | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | date   | null: false |
### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                    | Type     | Options     |
| ------------------------- | ------   | ----------- |
| name                      | string   | null: false |
| category                  | string   | null: false |
| products_information      | integer  | null: false |
| bo_shipping_charges       | integer  | null: false |
| area                      | integer  | null: false |
| estimated_shopping_date   | integer  | null: false |
| price                     | integer  | null: false |
| user                      | references | null: false, foreign_key: true   


### Association

- has_one :purchase
- belongs_to :user


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## address テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| postal_code       | string | null: false |
| prefectures+id    | integer | null: false |
| city              | string | null: false |
| address           | string | null: false |
| building_name     | string |  
| phone_number      | string | null: false |

### Association

- belongs_to :purchase
