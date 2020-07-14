# Tech-Board
ホワイトボードのように予定を共有できるWEBアプリケーション
### 開発環境
- ruby 2.5.1
- Rails 5.2.4.3
- mysql
- heroku

### Purpose
- 営業先でも予定を見ることができるようにするため
- ホワイトボードの予定一覧性を保持し、簡単に予定の変更をできるようにするため
- 電話連絡、FAX送信などの業務を軽減するため
- リモートでの業務をサポートするため
- 土木・建築業界の電子化をすすめるため

### Description
- ユーザー登録機能
- 現場登録機能
- チャット機能

### Usage
#### 1.ユーザー登録機能について
名前とEmail、Passwordでユーザーと新規登録できます。任意で電話番号も登録出来ます。
登録した情報はMypageから、確認・編集が出来ます。

#### 2.現場登録機能について
各ユーザーは担当する現場を新規作成が出来ます。新規作成画面では日時や作業内容、緯度経度から地図を埋め込むことが出来ます。新規作成を行うとTopページのカレンダーに表示され、変更があれば直感的に操作することができます。地図の印刷やFAX送信など煩わしい作業から開放されます。

#### 3.チャット機能について
現場を新規作成すると、その予定内でのチャットが有効になります。各担当者は全作業員に情報を発信することができます。情報を文字にすることで確実に伝えることが出来ます。細かい指示事項を画像を添付し送信することで、簡潔に情報が伝えることが出来ます。担当者が離れていても状況を把握することが出来ます。

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
