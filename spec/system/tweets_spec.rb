require 'rails_helper'

RSpec.describe "Tweet投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.build(:tweet)
  end
  context "Tweetが投稿できるとき" do
    it "ログインしたユーザーは新規投稿できる" do
      # ログインする
      visit new_user_session_path
      fill_in "Email Address", with: @user.email
      fill_in "Password", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq "/"
      visit tweets_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content("Tweet")
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in "tweet_title", with: @tweet.title
      fill_in "start-time", with: @tweet.start_time
      #find("tweet_prefecture_id").find("option[value=@tweet.prefecture_id]").select_option 
      fill_in "place", with: @tweet.place
      fill_in "tweet_wanted_list", with: @tweet.wanted_list
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Tweet.count}.by(1)
      # 投稿完了後TOPページに遷移する
      expect(current_path).to eq "tweets_path"
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      expect(page).to have_content(@tweet.image)
    end
  end
  context "Tweetが投稿できないとき" do
    it "ログインしていないと新規投稿ページに遷移できない" do
      # ログインページに遷移する
      visit tweets_path
      # ログインページに遷移する
      expect(current_path).to eq "/users/sign_in"
    end
  end

end
