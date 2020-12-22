require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
    @comment = FactoryBot.build(:comment)
  end

  context "Commentが投稿できるとき" do
    it "ログインしたユーザーはコメント投稿できる" do
      # ログインする
      visit new_user_session_path
      fill_in "Email Address", with: @user.email
      fill_in "Password", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq "/"
      visit tweets_path
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in "tweet_title", with: @tweet.title
      fill_in "start-time", with: @tweet.start_time
      attach_file("tweet[image]","public/images/test_BBQ2.png")
      find("#tweet_prefecture_id").find("option[value='#{@tweet.prefecture_id}']").select_option 
      fill_in "place", with: @tweet.place
      fill_in "tweet_wanted_list", with: @tweet.wanted_list
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Tweet.count}.by(1)
      # 投稿完了後TOPページに遷移する
      expect(current_path).to eq "/tweets.#{@user.id}"
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
      expect(page).to have_selector("img")
      # 詳細ページに移動する
      visit tweet_path(@tweet.id)
      # コメント入力欄があることを確認する
      expect(page).to have_content("思い出メモ")
      # コメントを入力する
      fill_in "comment_comment", with: @comment.comment
      #コメントするとcommentのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Comment.count}.by(1)
      # 投稿完了後同じページに留まる
      expect(current_path).to eq "/tweets/#{@tweet.id}"
      # 先ほど投稿した内容のコメントが存在することを確認する
      expect(page).to have_content(@comment_comment)
    end
  end
  context "Commentが投稿できないとき" do
    it "ログインしていないとユーザーはコメント投稿できない" do
      # ログインページに遷移する
      visit tweets_path
      # ログインページに遷移する
      expect(current_path).to eq "/users/sign_in"
    end
  end
end
