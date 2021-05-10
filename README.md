# テーブル設計

# users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birth                | date   | null: false               |

  t.string :email,              null: false, default: ""
  t.string :encrypted_password, null: false, default: ""
  t.string :nickname,           null: false, default: ""
  t.string :first_name,         null: false, default: ""
  t.string :last_name,          null: false, default: ""
  t.string :first_name_kana,    null: false, default: ""
  t.string :last_name_kana,     null: false, default: ""
  t.date   :birth,              null: false, default: ""

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :encrypted_password, presence: true
  validates :first_name,         presence: true
  validates :last_name,          presence: true
  validates :first_name_kana,    presence: true
  validates :last_name_kana,     presence: true
  validates :birth,              presence: true      

 

### Association

- has_many :items
- has_many :orders


# itemsテーブル

| Column                   | Type         | Options                        |
| ------------------------ | ------------ | ------------------------------ |
| name                     | string       | null: false                    | 
| info                     | text         | null: false                    |
| category_id              | integer      | null: false                    |
| sales_status_id          | integer      | null: false                    |
| delivery_charge_id       | integer      | null: false                    |
| prefecture_id            | integer      | null: false                    |
| scheduled_delivery_id    | integer      | null: false                    |
| price                    | integer      | null: false                    |
| user                     | references   | null: false, foreign_key: true |

### Association
 
- belongs_to :user
- has_one :order


# pay_forms テーブル
| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| postal_code              | string     | null: false                    | 
| prefecture_id            | integer    | null: false                    |
| city                     | string     | null: false                    |
| addresses                | string     | null: false                    |
| building                 | string     |                                |
| phone_number             | string     | null: false                    |
| order                    | references | null: false, foreign_key: true |

### Association
- belongs_to :order


# orders テーブル
| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true | 
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :pay_form

