# テーブル設計

# user テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birth_date1     | date   | null: false               |
| birth_date2     | date   | null: false               |
| birth_date3     | date   | null: false               |

### Association

- has_many :items
- has_many :orders


# item テーブル

| Column                   | Type         | Options                        |
| ------------------------ | ------------ | ------------------------------ |
| name                     | string       | null: false                    | 
| info                     | text         | null: false                    |
| category_id              | string       | null: false                    |
| sales_status_id          | string       | null: false                    |
| delivery_charge_id       | string       | null: false                    |
| prefecture_id            | string       | null: false                    |
| scheduled_delivery_id    | string       | null: false                    |
| price                    | date         | null: false                    |
| user_id                  | references   | null: false, foreign_key: true |

### Association
 
- belongs_to :user
- has_one :order


# pay_form テーブル
| Column                   | Type   | Options                        |
| ------------------------ | ------ | ------------------------------ |
| postal_code              | string | null: false                    | 
| prefecture               | string | null: false                    |
| city                     | string | null: false                    |
| addresses                | string | null: false                    |
| building                 | string | null: false                    |
| phone_number             | string | null: false                    |

### Association
- belongs_to :order


# order テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true | 
| item_id              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :pay_form

