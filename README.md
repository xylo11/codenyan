# **README**

![code size](https://img.shields.io/github/languages/code-size/xylo11/codenyan) [![Coverage Status](https://coveralls.io/repos/github/xylo11/codenyan/badge.svg?branch=main)](https://coveralls.io/github/xylo11/codenyan?branch=main)
<br><br>

# **アプリケーション名**
![Image from Gyazo](https://i.gyazo.com/0ecd17fdfb4c6e6f2dbe9cf54d71fe0c.png)

---
<br>

# **アプリケーション概要**
- ITエンジニア向けのオンライン掲示板型SNSです。
- エラーや開発に悩んだときに質問したり、自分の経験をアウトプットできます。
- またITエンジニアが集まるので業界のトレンド調査ができます。
<br><br>
---
<br>

# **機能について**

- ## ユーザー登録機能
![Image from Gyazo](https://i.gyazo.com/69402ff417f60af2be5a77d578879af0.gif)
<br><br>
<br><br>

- ## 入力に不備がある場合エラーメッセージに加えて該当入力欄を赤く表示します
![Image from Gyazo](https://i.gyazo.com/93cbd26f4717e765c6c71ce16be3b0b3.gif)

- ## ユーザープロフィール編集機能
![Image from Gyazo](https://i.gyazo.com/9045f24969f2245d0cd3ce8177d84031.gif)
<br><br>

- ## パーク(コミュニティ)機能
![Image from Gyazo](https://i.gyazo.com/900c31b5f461da11874584335e1ec144.gif)
<br><br>

- ## CKEditorを導入した投稿機能
![Image from Gyazo](https://i.gyazo.com/a681066759afc30822ebd6af6c54ad64.gif)

<br><br>

- ## 投稿に対する非同期コメント機能
![Image from Gyazo](https://i.gyazo.com/f6c5f6e371e77c0fd1809d2eafcd988f.gif)
<br><br>

---
<br><br>

## 今後の実装
- 投稿及びコメントの非同期編集についてCKEditorを使用した状態でも入力欄に元のテキストが表示されるようにする
- コメントに対するコメント機能(ネスト)
- フォロー機能
- チャット機能
- いいね機能
- 通知機能
- ブックマーク機能

<br><br>

---

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

<br><br>

---

<br><br>

# **ER図**

[![Image from Gyazo](https://i.gyazo.com/f447a5fbc9642e67ff884f76e75641f0.png)](https://gyazo.com/f447a5fbc9642e67ff884f76e75641f0)