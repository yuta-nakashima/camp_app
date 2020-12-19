require 'rails_helper'
# bundle exec rspec spec/models/comment_spec.rb 
RSpec.describe Comment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント機能" do
    context "コメントができる" do
      it "コメントが入っていればコメントができる"do
        expect(@comment).to be_valid
      end
    end

    context "コメントができない" do
      it "コメントが必須であること" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
    end
  end
end
