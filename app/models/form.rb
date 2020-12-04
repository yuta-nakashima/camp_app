class Form 
  include ActiveModel::Model
  attr_accessor :prefecture, :place, :tweet_id, :start_time, :user_id, :comment, :image, :images, :wanted_list, :title, :item_image

with_options presence: true do
  validates :title
  validates :start_time
  validates :image
  validates :prefecture
  validates :place
end

  def save
    tweet = Tweet.create(start_time: start_time, user_id: user_id, title: title, image: image, images: images, item_image: item_image)
    Member.create(prefecture: prefecture, place: place, tweet_id: tweet.id)
    Comment.create(comment: comment, tweet_id: tweet.id,wanted_list: wanted_list)
  end
end