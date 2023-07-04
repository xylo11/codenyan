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

# **URL**
https://codenyan.onrender.com
<br><br>

---
<br><br>

# **テスト用アカウント**

- Basic認証ID:pneko  
- Basic認証パスワード0222  
<テストユーザー1>・メールアドレス : test@example ・パスワード : test1234 ・ユーザー名 : test  
<テストユーザー2>・メールアドレス : sample@example ・パスワード : sample1234 ・ユーザー名 : sample  
<br><br>

---
<br><br>

# **ご利用方法**

- ## ヘッダーの各種機能  
  ・アプリロゴをクリックするとトップページへ遷移します。  
  ・Select Optionと記載されているプルダウンメニューから各ページへ遷移します。  
  ・検索ボックス(表示のみ)  
  ・Talkアイコン、通知アイコン(表示のみ)  
  ・アバター画像とニックネームの表示  
  ・非ログイン時(新規登録、ログイン)、ログイン時(登録情報編集、プロフィール、ログアウト)  
<br>

- ## パーク作成機能、参加機能
  ・ヘッダーのプルダウンメニューよりパーク作成ができます。作成後参加することでプルダウンメニュー内に参加しているパークが追加されます。パークはコミュニティにに当たる機能で投稿時には必須となります。
<br>

- ## 投稿機能
  ・トップページのCreate New Postより新規投稿画面へ遷移します。  
  ・パークの選択、タイトル、本文を入力しPOSTボタンを押すことで投稿が出来ます。※すべての項目について空では投稿はできません。
<br>

- ## 投稿編集・削除機能
  ・投稿完了後の投稿詳細画面にて投稿者本人であれば編集・削除をすることができます。
<br>

- ## コメント投稿機能
  ・投稿詳細画面にて投稿に対してコメントする事ができます。
<br><br>

___
<br><br>

# **アプリケーションを作成した背景**
自身のプログラミング勉強中未経験エンジニアをペルソナとして、プログラミングに関する問題解決や交流を目的に開発しました。  
このアプリケーションではユーザーが自身のエラーについて投稿したり、学習したことをアウトプットすることでお互いに知識を共有しスキルアップすることが出来ます。

<br><br>

---
<br><br>

# **洗い出した要件**
https://docs.google.com/spreadsheets/d/1xWwkkOdEOcIoZQ4KHuAllP0BzuyIjPTQU5CY_IeLlBo/edit#gid=0

<br><br>

---
<br><br>

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

# **工夫したポイント**
- テキストエディタとしてCKEditorを導入し入力の柔軟性に力を入れました。
- ヘッダーのプルダウンメニューにより各ページへの遷移を容易にしました。
- 全体のカラーを白と黒を基調にして落ち着いた雰囲気にしました。
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

# **データベース設計**

[![Image from Gyazo](https://i.gyazo.com/f447a5fbc9642e67ff884f76e75641f0.png)](https://gyazo.com/f447a5fbc9642e67ff884f76e75641f0)

<br><br>

---

<br><br>

# **画面遷移図**

![Image from Gyazo](https://i.gyazo.com/05aacc175c212551f818bb70f56635d2.png)

<br><br>

---
<br><br>

# **開発環境**
・フロントエンド(HTML/CSS、JavaScript)  
・バックエンド(Ruby on Rails、MySQL)  
・インフラ（Render、S3)  
・テスト（Rspec）  
・テキストエディタ（Visual Studio Code）  
・タスク管理（Github）  
<br><br>

---
<br><br>

# **ローカルでの動作方法**
以下のコマンドを順に実行してください。  
```
% git clone https://github.com/xylo11/codenyan.git
% cd codenyan
% bundle install
% rails db:create
% rails db:migrate
% yarn install
```

---