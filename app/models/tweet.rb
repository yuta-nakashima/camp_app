class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :data
  has_one_attached :image
  has_one_attached :item_image
  has_many_attached :memory_images

  with_options presence: true do
    validates :title
    validates :start_time
    validates :image
    validates :prefecture_id
    validates :place
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
