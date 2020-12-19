require 'rails_helper'
# bundle exec rspec spec/models/user_spec.rb 
RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまく行くとき" do
      it "全てが入力されていれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で登録できる" do
        @user.password = "qwe123"
        @user.password_confirmation= "qwe123"
        expect(@user).to be_valid
      end
      it "nicknameが2文字以上で登録ができる" do
        @user.nickname = "TM"
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかないとき" do
      it "nicknameが必須であること" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが必須であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emaiに一意性があること" do
        @users = FactoryBot.create(:user)
        @user.email = @users.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password には英字と数字の両方を含めて設定してください", "Password confirmation doesn't match Password")
      end
      it "password-confirmationが必須であること" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは数字・アルファベットの組み合わせであること" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは6文字以上であること" do
        @user.password = "w2w2w"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword-confirmationが一致しないと登録できない" do
        @user.password = "www222"
        @user.password_confirmation = "qqq222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
