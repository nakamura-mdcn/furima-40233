<!-- usersテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | integer | null: false               |

### Association
has_many :items
has_many :orders

<!-- itemsテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| name                | string     | null: false, foreign_key: true |
| information         | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
belongs_to :user
<!-- 33行目は必要か不明 -->
belongs_to :order 


<!-- ordersテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| number          | integer     | null: false                    |
| expiration_date | integer     | null: false                    |
| cvc             | integer     | null: false                    |
| postal_code     | integer     | null: false                    |
| prefecture      | string      | null: false                    |
| city            | string      | null: false                    |
| addresses       | string      | null: false                    |
| building        | string      | null: false                    |
| phone_number    | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
