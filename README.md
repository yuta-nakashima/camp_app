## アプリケーション名
 camp-app(Camp!Camp!Camp!)

## 目次
1.開発環境<br>
2.アプリケーション概要<br>
3.機能<br>
4.デモ<br>
5.使い方<br>
6.

## 1.開発環境
ruby '2.6.5'<br>
rails '6.0.0'<br>
mysql2 '0.5.3'<br>
aws-sdk-s3"<br>
puma '3.11'<br>
unicorn '5.4.1'<br>

## 2.アプリケーション概要
 キャンプをこよなく愛す人のためのキャンプダイアリーアプリです。<br>
 このアプリではキャンプの思い出を残すと同時に過去に訪問した場所や使用したアイテムの記録も残すことができます。<br>
 友達に画像をみてもらう際に、携帯のアルバムを必死に探す必要なくこのアプリ1つで瞬時にシェアすることが可能となります。<br>
 また、その時に欲しいと思ったアイテムを記録し、見返した時にすぐに検索できるようになっているため
キャンプ用品サプライヤーとの関係性を築くことでさらなる拡張が可能となります。<br>

### 3.機能
写真一覧機能: 投稿した写真を一覧で見れるようにする。写真一覧表示を可能にする。<br>
場所検索: 行先別で検索できるようにする。 都道府県、キャンプ場名のいずれかを指定した上で、検索を可能にする。 <br>
アイテム検索: その時に欲しいと思ったアイテムを記録する。欲しいいものリストを一覧にしてその場で検索を可能にする。アイテムの検索をすぐに行えるようにgoogle検索をその場で行えるようにする。<br>
コメント機能: その場の気持ちを簡単にコメントする。	写真投稿後コメントすることを可能にする。<br>

## 4.デモ
トップページ<br> <img src=(https://gyazo.com/24978dc41850c5657cd7a9764499c9fc)><br>
ログイン後トップページ<br> https://gyazo.com/b478dd93056d7f77d0527be76a4b4357<br>
投稿機能・写真一覧機能<br> https://gyazo.com/d971cecda1d089131608c175395bc1b2<br>
検索機能<br> https://gyazo.com/401dca74631dcec62ae3ee038e0c1134<br>

## 5.使い方
URL:	http://52.197.84.107/<br>
テスト用アカウント:	Email: 11@gmail.com, Id: q12345<br>
Basic認証: ID:admin, PW: 2222<br>
利用方法:	新規登録を行い、キャンプの思い出を記録します。<br>

## 6.
 目指した課題解決: キャンプの写真や記録を思い出す時間がもったいないと感じ、日常化した写真撮影で、思い出・記憶を探すことに時間がかかり、探し出す時間を短縮したキャンプ専用のアプリを制作しました。	このアプリケーションを通じて、キャンプでの思い出や、場所、その時に感じたことを記録することで、思い出をすぐにシェアすることができるようになります。


 データベース設計: `https://github.com/yuta-nakashima/camp_app/files/5714060/default.pdf`

 ローカルでの動作方法: `$ git clone https://github.com/yuta-nakashima/chat-app.git`

ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。


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