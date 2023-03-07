# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | --------------------------|
| name                   | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| first_name             | string | null: false               |
| last_ name             | string | null: false               |
| first_name_kana        | string | null: false               |
| last_name_kana         | string | null: false               |
| birth_day              | date   | null: false               |

## association

  has_many:items
  has_many:purchase_records

## items テーブル

| Column             | Type            | Options                         |
| ------------------ | --------------- | ------------------------------- |
| user               | references      | null: false, foreign_key: true  |
| name               | string          | null: false                     |
| price              | integer         | null: false                     |
| item_text          | text            | null: false                     |
| category_id        | integer         | null: false, foreign_key: true  |
| situation_id       | integer         | null: false, foreign_key: true  |
| shipping_id        | integer         | null: false, foreign_key: true  |
| delivery_area_id   | integer         | null: false, foreign_key: true  |
| delivery_days_id   | integer         | null: false, foreign_key: true  |

## association

belongs_to:users
has_one:purchase_record

## purchase_record テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
 
 ## association

belongs_to:user
belongs_to:item
has_one:shipping_address

## shipping_address テーブル

| Column             | Type            |Options                         |
| ------------------ | --------------- |------------------------------- |
| post_cord          | string          | null: false                    |
| delivery_area_id   | integer         | null: false, foreign_key: true |
| municipality       | string          | null: false                    |
| address            | string          | null: false                    |
| building_name      | string          |                                |
| phone_number       | string          | null: false                    |
 
## association

belongs_to:purchase_record