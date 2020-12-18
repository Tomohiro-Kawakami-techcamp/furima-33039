# テーブル設計

## users テーブル

| Column            | Type     | Options     |
| ---------------   | -------- | ----------- |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |
| last_name         | string   | null: false |
| first_name        | string   | null: false |
| last_name_kana    | string   | null: false |
| first_name_kana   | string   | null: false |
| birth             | date     | null: false |

### Association
- has_many :items
- has_many :orders

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null:false                     |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| phone_number        | numeric    | null: false                    |
| user                | references | null: false, foreign_key: true | 
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| price               | string     | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :order