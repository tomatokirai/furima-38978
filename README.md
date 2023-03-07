# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | --------------------------|
| name                   | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| first_name             | string | null: false               |
| last_name             | string | null: false               |
| first_name_kana        | string | null: false               |
| last_name_kana         | string | null: false               |
| birth_day              | date   | null: false               |

## association

  has_many :items
  has_many :purchase_records

## items テーブル

| Column             | Type            | Options                         |
| ------------------ | --------------- | ------------------------------- |
| user               | references      | null: false, foreign_key: true  |
| name               | string          | null: false                     |
| price              | integer         | null: false                     |
| item_text          | text            | null: false                     |
| category_id        | integer         | null: false                     |
| situation_id       | integer         | null: false                     |
| shipping_id        | integer         | null: false                     |
| delivery_area_id   | integer         | null: false                     |
| delivery_day_id   | integer         | null: false                     |

## association

belongs_to :user
has_one :purchase_record

## purchase_records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
 
 ## association

belongs_to :user
belongs_to :item
has_one: shipping_address

## shipping_addresses テーブル

| Column             | Type            |Options                         |
| ------------------ | --------------- |------------------------------- |
| post_cord          | string          | null: false                    |
| delivery_area_id   | integer         | null: false                    |
| municipality       | string          | null: false                    |
| address            | string          | null: false                    |
| building_name      | string          |                                |
| phone_number       | string          | null: false                    |
| purchase_record    | references      | null: false, foreign_key: true |
 
## association

belongs_to :purchase_record