# **テーブル設計**

## users テーブル

| Column             | Type   | Null  | Options      |
| ------------------ | ------ | ----- | ------------ |
| username           | string | false | unique: true |
| email              | string | false | unique: true |
| encrypted_password | string | false |              |

- has_one  :user_profile, dependent: :destroy
- has_many :posts
- has_many :comments
- has_many :talks
- has_many :alerts
- has_many :park_users
- has_many :parks, through: :park_users
- has_many :relationships
- has_many :following, through: :relationships
- has_many :followers, through: :relationships
- has_many :bookmarks
- has_many :votes


## **user_profilesテーブル**

| Column   | Type       | Null  | Options           |
| -------- | ---------- | ----- | ----------------- |
| nickname | string     | false |                   |
| intro    | text       |       |                   |
| user_id  | references |       | foreign_key: true |

- belongs_to :user
- has_one_attached :avatar (アバター画像)

## **postsテーブル**

| Column          | Type       | Null       | Options           |
| --------------- | ---------- | ---------- | ----------------- |
| title           | string     | false      |                   |
| content         | text       | false      |                   |
| upvotes         | integer    | default: 0 |                   |
| downvotes       | integer    | default: 0 |                   |
| bookmark_counts | integer    | default: 0 |                   |
| user_id         | references | false      | foreign_key: true |
| park_id         | references | false      | foreign_key: true |

- belongs_to :user
- belongs_to :park
- has_many_attached :images
- has_many :alerts, as: :alertable
- has_many :comments
- has_many :bookmarks
- has_many :votes, as: :votable

## **commentsテーブル**

| Column            | Type       | Null       | Options           |
| ----------------- | ---------- | ---------- | ----------------- |
| content           | text       | false      |                   |
| upvotes           | integer    | default: 0 |                   |
| downvotes         | integer    | default: 0 |                   |
| user_id           | references | false      | foreign_key: true |
| post_id           | references | false      | foreign_key: true |

- belongs_to :user
- belongs_to :post
- has_many :alerts, as: :alertable
- has_many_attached :images
- has_many :votes, as: :votable

## **parksテーブル**

| Column | Type   | Null  | Options |
| ------ | ------ | ----- | ------- |
| name   | string | false |         |
| info   | text   |       |         |

- has_many :park_users
- has_many :users, through: :park_users
- has_many :posts

## **park_usersテーブル**

| Column  | Type       | Null  | Options           |
| ------- | ---------- | ----- | ----------------- |
| user_id | references | false | foreign_key: true |
| park_id | references | false | foreign_key: true |

- belongs_to :user
- belongs_to :park

## **talksテーブル**

| Column      | Type       | Null           | Options           |
| ----------- | ---------- | -------------- | ----------------- |
| content     | text       | false          |                   |
| read        | boolean    | default: false |                   |
| sender_id   | references | false          | foreign_key: true |
| receiver_id | references | false          | foreign_key: true |

- belongs_to :sender, class_name: 'User'
- belongs_to :receiver, class_name: 'User'
- has_many :alerts, as: :alertable


## **alertsテーブル**

| Column         | Type       | Null  | Options           |
| -------------- | ---------- | ----- | ----------------- |
| content        | text       | false |                   |
| alertable_type | string     | false |                   |
| alertable_id   | references | false | foreign_key: true |
| user_id        | references | false | foreign_key: true |

- belongs_to :alertable, polymorphic: true
- belongs_to :user

## **relationshipsテーブル**

| Column       | Type       | Null  | Options           |
| ------------ | ---------- | ----- | ----------------- |
| following_id | references | false | foreign_key: true |
| follower_id  | references | false | foreign_key: true |

belongs_to :follower, class_name: 'User'
belongs_to :following, class_name: 'User'

## **bookmarksテーブル**

| Column  | Type       | Null  | Options           |
| ------- | ---------- | ----- | ----------------- |
| user_id | references | false | foreign_key: true |
| post_id | references | false | foreign_key: true |

- belongs_to :user
- belongs_to :post

## **votesテーブル**

| Column       | Type       | Null  | Options           |
| ------------ | ---------- | ----- | ----------------- |
| value        | integer    | false |                   |
| votable_type | string     | false |                   |
| votable_id   | references | false | foreign_key: true |
| user_id      | references | false | foreign_key: true |

- belongs_to :votable, polymorphic: true
- belongs_to :user

# **ER図**

[![Image from Gyazo](https://i.gyazo.com/f447a5fbc9642e67ff884f76e75641f0.png)](https://gyazo.com/f447a5fbc9642e67ff884f76e75641f0)