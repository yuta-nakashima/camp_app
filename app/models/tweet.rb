class Tweet < ApplicationRecord
  belongs_to :user
  has_one :member
  has_many :comments
  has_one_attached :image
  has_one_attached :item_image
  has_one_attached :images


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture



end
