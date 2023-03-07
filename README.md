# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| name               | string | null: false              |
| email              | string | null: false unique: true |
| password           | string | null: false              |

## association

  has_many:items
  has_many:purchase_record

## items テーブル

| Column             | Type            | Options                         |
| ------------------ | --------------- | ------------------------------- |
| user_id            | references      | null: false, foreign_key: true  |
| name               | string          | null: false, precision:40       |
| price              | integer         | null: false                     |
| item_text          | text            | null: false, precision:1000     |
| category           | integer         | null: false                     |
| situation          | integer         | null: false                     |
| shipping           | integer         | null: false                     |
| delivery_area      | integer         | null: false                     |
| delivery_days      | integer         | null: false                     |

## association

belongs_to:users
has_one:purchase_record

## purchase_record テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
 
 ## association

belongs_to:user
belongs_to:item
has_one:shipping_address

## shipping_address テーブル

| Column          | Type            |Options                        |
| --------------- | --------------- |------------------------------ |
| post-cord       | string          | null: false                   |
| prefectures     | integer         | null: false                   |
| municipality    | string          | null: false                   |
| address         | string          | null: false                   |
| building_name   | string          |                               |
| phone_number    | string          | null: false                   |

## association

belongs_to:purchase_record