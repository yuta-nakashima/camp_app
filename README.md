## アプリケーション名
 camp-app(Camp!Camp!Camp!)

## 目次
1.開発環境<br>
2.アプリケーション概要<br>
3.機能<br>
4.デモ<br>
5.課題解決<br>
6.使い方<br>

## 1.開発環境
ruby '2.6.5'<br>
rails '6.0.0'<br>
### ローカル環境
mysql2 '0.5.3'<br>
puma '3.11'<br>
### 本番環境
aws-sdk-s3"<br>
unicorn '5.4.1'<br>

## 2.アプリケーション概要
キャンプをこよなく愛す人のためのキャンプダイアリーアプリです。<br>
このアプリではキャンプの思い出を残すと同時に過去に訪問した場所や使用したアイテムの記録も残すことができます。<br>
友達に画像をみてもらう際に、携帯のアルバムを必死に探す必要なくこのアプリ1つで瞬時にシェアすることが可能となります。<br>
また、その時に欲しいと思ったアイテムを記録し、見返した時にすぐに検索できるようになっています。<br>
キャンプ用品サプライヤーとの関係性を築くことでさらなる拡張が可能となります。<br>

### 3.機能
<b>写真一覧機能:</b> 投稿した写真を一覧で見ることが出来ます。<br>
<b>場所検索:</b> 都道府県、キャンプ場名のいずれかを指定した上で、検索をすることが出来ます。キャンプ場名は、キーワードを含んでいれば抽出可能です。 <br>
<b>アイテム検索:</b> その時に欲しいと思ったアイテムを記録することができ、一覧からアイテムの検索をすぐに行えるようにgoogle検索をその場で行うことが可能となります。<br>
<b>コメント機能:</b> その場の気持ちを簡単にコメントすることが出来ます。<br>

## 4.デモ
### トップページ
![8ed3aeab8aed323144ac10c2ef4ae83c-min](https://user-images.githubusercontent.com/73780934/103085862-48dbd480-4626-11eb-8086-8dac673304f3.gif)

### ログイン後トップページ
![b478dd93056d7f77d0527be76a4b4357-min](https://user-images.githubusercontent.com/73780934/103086779-cd2f5700-4628-11eb-8d0c-d19cb19cfe3b.gif)

### 投稿機能・写真一覧機能
![d971cecda1d089131608c175395bc1b2-min](https://user-images.githubusercontent.com/73780934/103086627-73c72800-4628-11eb-8e8d-6a7110b2c4f0.gif)

### 検索機能
 <img src="https://i.gyazo.com/401dca74631dcec62ae3ee038e0c1134.gif" >

### データベース設計<br>
![default.pdf](https://github.com/yuta-nakashima/camp_app/files/5741037/default.pdf)

## 5.課題解決
友人から素晴らしいキャンプの思い出を見せてもらう際に、キャンプの写真や記録を探している時間がもったいないと感じ、<br>
撮影した写真を探し出す時間を短縮したキャンプ専用のアプリを制作しました。	<br>
このアプリケーションを通じて、キャンプでの思い出や、場所、その時に感じたことを記録することで、キャンプの思い出をすぐにシェアすることができるようになります。

## 6.使い方
### URL<br>
http://52.197.84.107/<br>
### テスト用アカウント<br>
Email: 11@gmail.com, Id: q12345<br>
### Basic認証<br>
ID:admin, PW: 2222<br>
### 利用方法<br>
新規登録を行い、キャンプの思い出を記録します。<br>

### ローカルでの動作方法<br>
$ git clone https://github.com/yuta-nakashima/chat-app.git<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>



### テーブル
usersテーブル

| Column               |Type     |Options             |
| ---------------------|---------|------------------- |
| nickname             |string   |null: false         |
| email                |string   |null: false         |
| encrypted_password   |string   |null: false         |


### Association
- has_many   :tweets

tweetsテーブル

| Column          |Type               |Options                    |
| ----------------|------------- |------------------------------- |
| start_time      |datetime      |null: false                     |
| title           |string        |null: false                     |
| prefecture_id   |integer       |null: false                     |
| place           |string        |null: false                     |
| wanted_list     |string        |null: false                     |
| user            |references    |null: false                     |

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :data
- has_one_attached :image
- has_one_attached :item_image
- has_many_attached :memory_images

### Association
- belongs_to :tweet

commentsテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| comment         |text          |null: false                     |
| tweet_id        |references    |                                |
| user_id         |references    |                                |

### Association
- belongs_to :tweet
- belongs_to :user
