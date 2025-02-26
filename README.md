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


## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| product    | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |


## address テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| zipcode    | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| street     | string     | null: false                    |
| building   | string     |                                |
| phone      | integer    | null: false                    |
| address    | references | null: false, foreign_key: true |

