# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
#テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------  | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| first_name  | string | null: false |
| birth_day   | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| text       | text       | null: false                    |
| image      | string     | null: false                    |
| price      | integer    | null: false                    |
| category   | integer    | null: false                    |
| status     | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| burden     | integer    | null: false                    |
| days       | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_many   : comments
- has_one    : buys

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| text    | text       | null: false                    |


### Association

- belongs_to :user_id
- belongs_to :item_id

## buys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |
| card_info       | integer    | null: false                    |
| expiration_date | date       | null: false                    |
| security_code   | integer    | null: false                    |

### Association

- belongs_to : users
- has_one    : addresses

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| address_line1 | string  | null: false |
| address_line2 | string  |             |
| phone_num     | integer | null: false |

### Association

- has_one :buys

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
