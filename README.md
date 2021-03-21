# テーブル設計

## usersテーブル

| Colmn             | Type        | Options                   |
|:------------------|------------:|:-------------------------:|
| nickname          | string      | null: false               |
| email             | string      | null: false, unique:true  |
| encrypted_password| string      | null: false               |
| family_name       | string      | null: false               |
| first_name        | string      | null: false               |
| family_name_kana  | string      | null: false               |
| first_name_kana   | string      | null: false               |
| birthday          | date        | null: false               |

### Association

- has_many :items
- has_many :oders

## addressesテーブル

| Colmn       | Type        | Options                        |
|:------------|------------:|:------------------------------:|
| postcode    | integer     | null: false                    |
| prefecture  | string      | null: false                    |
| city        | string      | null: false                    |
| block       | integer     | null: false                    |
| building    | string      |                                |
| phone_number| integer     | null: false                    |
| user        | references  | null: false, foreign_key: true |


## itemsテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| title             | string      | null: false                     |
| text              | text        | null: false                     |
| category_id       | integer     | null: false                     |
| condition_id      | integer     | null: false                     |
| delivery_charge_id| integer     | null: false                     |
| delivery_area_id  | integer     | null: false                     |
| delivery_day_id   | integer     | null: false                     |
| price             | integer     | null: false                     |
| user              | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| item              | references  | null: false, foreign_key: true  |
| user              | references  | null: false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user