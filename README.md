# テーブル設計

## usersテーブル

| Colmn            | Type        | Options      |
|:-----------------|------------:|:------------:|
| nickname         | string      | null: false  |
| email            | string      | null: false  |
| password         | string      | null: false  |
| family_name      | string      | null: false  |
| first_name       | string      | null: false  |
| family_name_kana | string      | null: false  |
| first_name_kana  | string      | null: false  |
| birth_year       | integer     | null: false  |
| birth_month      | integer     | null: false  |
| birth_date       | integer     | null: false  |

### Association

- has_many :items
- belongs_to :address

## addressテーブル

| Colmn       | Type        | Options                        |
|:------------|------------:|:------------------------------:|
| postcode    | integer     | null: false                    |
| prefecture  | string      | null: false                    |
| city        | string      | null: false                    |
| block       | integer     | null: false                    |
| building    | string      |                                |
| phone_number| integer     | null: false                    |
| user_id     | references  | null: false, foreign_key: true |

### Association

- belongs_to :user

## itemsテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| title             | string      | null: false                     |
| text              | text        | null: false                     |
| category          | integer     | null: false                     |
| condition         | integer     | null: false                     |
| delivery_charge   | integer     | null: false                     |
| delivery_area     | integer     | null: false                     |
| delivery_day      | integer     | null: false                     |
| price             | integer     | null: false                     |
| user_id           | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :oder

## odersテーブル

| Colmn             | Type        | Options                         |
|:------------------|------------:|:-------------------------------:|
| item_id           | references  | null: false, foreign_key: true  |
| user_id           | references  | null: false, foreign_key: true  |

### Association

- belongs_to :item