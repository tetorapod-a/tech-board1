# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# tech-board DB設計
## usersテーブル 
|Column|Type|Option|
|------|----|------|
|name|string|null: false, index: true|
|password|string|null: false|
|email|string|null: false|
|phone|string||
### Association
- has_many :plans　through: :user_plans
- has_many :message 
- has_many :group through: :user_groups

## groupテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|plan_id|references|null: false, foreign_key: true|
### Association
- has_many :users through: :user_groups
- has_many :messages
- belong_to :plan

## messageテーブル
|Column|Type|Option|
|------|----|------|
|body|text|null: false|
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :group

## planテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|date|datetime||
|place|string||
|client|string||
|body|string||
|detail|text||
|limit|string||
### Association
- belong_to :group
- has_many :user-plans

## user-groupsテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :group

## user-plansテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|plan|references|null: false, foreign_key: true|
### Association
- belong_to :user
- belong_to :plan