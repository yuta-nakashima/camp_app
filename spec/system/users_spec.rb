require 'rails_helper'
# bundle exec rspec spec/system/users_spec.rb
def basic_pass(path)
  username = ENV["admin"]
  password = ENV["2222"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザー新規登録ができる" do
    it "正しい情報を入力すればユーザー新規登録ができてトップページに移動する" do
      
      # トップページに移動する
      visit root_path
      #basic認証
      basic_pass new_user_session_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content("Sign up")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "Nickname" , with: @user.nickname
      fill_in "Email Address" , with: @user.email
      fill_in "Password" , with: @user.password
      fill_in "Password confirmation" , with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      # ユーザートップページへ遷移する
      expect(current_path).to eq "/"
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      #expect(
      #  find(".user_nav").find("span").hover
      #).to have_content("Log out")
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      #expect(page).to have_no_content("Sign In")
      #expect(page).to have_no_content("Sign Up")
    end
  end

  context "ユーザー登録ができないとき" do
    it "誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる" do
      # トップページに移動する
      visit root_path
      #basic認証
      basic_pass new_user_session_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content("Sign up")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "Nickname" , with: ""
      fill_in "Email Address" , with: ""
      fill_in "Password" , with: ""
      fill_in "Password confirmation" , with: ""
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
    }.to change {User.count}.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end
RSpec.describe "ユーザーログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context "ログインできるとき" do
    it "保存されているユーザー情報と合致すればログインができる" do
      # トップページに移動する
      visit root_path
      #basic認証
      basic_pass new_user_session_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content("Sign In")
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in "Email Address" , with: @user.email
      fill_in "Password" , with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq "/"    
    end
  end
  context "ログインできないとき" do
    it "保存されているユーザー情報と合致しなければログインできない" do
      # トップページに移動する
      visit root_path
      #basic認証
      basic_pass new_user_session_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content("Sign In")
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in "Email Address", with: ""
      fill_in "Password", with: ""
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq "/users/sign_in"
    end
  end
end