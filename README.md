### アプリケーション名
> camp-app(Camp!Camp!Camp!)
### アプリケーション概要
> キャンプをこよなく愛す人のためのキャンプダイアリーアプリです。
> このアプリではキャンプの思い出を残すと同時に過去に訪問した場所や使用したアイテムの記録も残すことができます。
> 友達に画像をみてもらう際に、携帯のアルバムを必死に探す必要なくこのアプリ1つで瞬時にシェアすることが可能となります。
> また、その時に欲しいと思ったアイテムを記録し、見返した時にすぐに検索できるようになっているため
>キャンプ用品サプライヤーとの関係性を築くことでさらなる拡張が可能となります。

###　その他内容
> URL:	デプロイ済みのURLを記述しましょう。デプロイが済んでいない場合は、デプロイ次第記述しましょう。

> テスト用アカウント:	Email: 11@gmail.com, Id: q12345
  Basic認証: ID:admin, PW: 2222

> 利用方法:	新規登録を行い、キャンプの思い出を記録します。

> 目指した課題解決: キャンプの写真や記録を思い出す時間がもったいないと感じ、日常化した写真撮影で、思い出・記憶を探すことに時間がかかり、探し出す時間を短縮したキャンプ専用のアプリを制作しました。	このアプリケーションを通じて、キャンプでの思い出や、場所、その時に感じたことを記録することで、思い出をすぐにシェアすることができるようになります。

> 洗い出した要件	スプレッドシートにまとめた要件定義を、マークダウンで記述しなおしましょう。

> 実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

> 実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。

> データベース設計: https://github.com/yuta-nakashima/camp_app/files/5714060/default.pdf

> ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。



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