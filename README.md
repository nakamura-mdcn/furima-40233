<!-- usersテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | date    | null: false               |

### Association
has_many :items
has_many :orders

<!-- itemsテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| name                   | string      | null: false, foreign_key: true |
| information            | text        | null: false                    |
| category_id            | integer     | null: false                    |
| sales_status_id        | integer     | null: false                    |
| shipping_fee_status_id | integer     | null: false                    |
| prefecture_id          | integer     | null: false                    |
| scheduled_delivery_id  | integer     | null: false                    |
| price                  | integer     | null: false                    |
| user                   | references  | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order
belongs_to :address
<!-- 外部キー　別モデルを作成 -->
belongs_to :prefecture_id
belongs_to :category_id
belongs_to :sales_status_id
belongs_to :shipping_fee_status_id
belongs_to :scheduled_delivery_id

<!-- addressテーブル 住所-->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| postal_code     | integer     | null: false                    |
| prefecture_id   | integer     | null: false                    |
| city            | string      | null: false                    |
| addresses       | string      | null: false                    |
| building        | string      | null: false                    |
| phone_number    | integer     | null: false                    |
| item            | references  | null: false, foreign_key: true |

### Association
belongs_to :prefecture_id
belongs_to :item

<!-- purchase_historiesテーブル 購入履歴-->
| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- |
| user | references  | null: false, foreign_key: true |
| item | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

