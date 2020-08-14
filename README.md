# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル

| Column      | Type       | Options                        |
| ------      | ------     | -----------                    |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| burden      | string     | null: false                    |
| region      | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchases テーブル

| Column          | Type   | Options     |
| ------          | ------ | ----------- |
| card_number     | string | null: false |
| expiration_date | string | null: false |
| security_code   | string | null: false |
| postal_code     | string | null: false |
| prefectures     | string | null: false |
| municipality    | string | null: false |
| address         | string | null: false |
| building_name   | string |             |
| phone_number    | string | null: false |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item