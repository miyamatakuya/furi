## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| birthday        | string | null: false |
### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| name                      | string | null: false |
| category                  | string | null: false |
| products_information      | string | null: false |
| BO_shipping_charges       | string | null: false |
| area                      | string | null: false |
| Estimated_shopping_date   | string | null: false |
| price                     | string | null: false |
| user                      | references | null: false, foreign_key: true   


### Association

- has_many :purchase
- belongs_to :user


## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## address テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| postal_code     | string | null: false |
| prefectures     | string | null: false |
| city            | string | null: false |
| address         | string | null: false |
| building_name   | string | null: false |
| phone_number    | string | null: false |

### Association

- has_many :purchase
