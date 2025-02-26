# furima-41973のER図

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_kana      | string | null: false               |
| firstname_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association
has_many :products
has_many :orders

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false, foreign_key: true |
| shipping_fee  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one    :order


## orders テーブル

| Column     | Type       | Options                                      |
| ---------- | ---------- | -------------------------------------------- |
| product    | references | null: false, foreign_key: true, unique: true |
| user       | references | null: false, foreign_key: true               |


### Association
belongs_to :user
has_one    :product
has_one    :address


## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zipcode    | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| street     | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| order      | references | null: false, foreign_key: true |

### Association
has_one :order