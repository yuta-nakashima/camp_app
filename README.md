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
| user            |references    |null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :member
- has_many :comments
- has_one_attached :image
- has_one_attached :item_images
- has_many_attached :images

membersテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| prefecture      |integer       |null: false                     |
| place           |string        |null: false                     |
| tweet           |references    |null: false, foreign_key: true  |

### Association
- belongs_to :tweet

commentsテーブル

| Column          |Type          |Options                         |
| ----------------|--------------|------------------------------- |
| comment         |string        |null: false                     |
| wanted_list     |string        |null: false                     |
| tweet           |references    |null: false, foreign_key: true  |

### Association
- belongs_to :tweet

