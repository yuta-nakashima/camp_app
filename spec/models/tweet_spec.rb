require 'rails_helper'
# bundle exec rspec spec/models/tweet_spec.rb 
RSpec.describe Tweet, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe "tweetの投稿" do
    context "tweetの投稿ができる" do
      it"全て投稿していれば投稿できる"do
        expect(@tweet).to be_valid
      end
      it"item_image,memory_image,wanted_listがなくても投稿できる"do
        @tweet.item_image = nil
        @tweet.memory_images = nil
        @tweet.wanted_list = ""
        expect(@tweet).to be_valid
      end
    end
  
    context "tweetの投稿ができない" do
      it"タイトルは必須であること"do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end
      it"日付は必須であること"do
        @tweet.start_time = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Start time can't be blank")
      end
      it"メンバー画像（image）は必須であること"do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Image can't be blank")
      end
      it"都道府県選択が必須であること"do
        @tweet.prefecture_id = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Prefecture can't be blank")
      end
      it"キャンプ場名が必須であること"do
        @tweet.place = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Place can't be blank")
      end
    end
  end
end
