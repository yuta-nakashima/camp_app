class DataController < ApplicationController
  before_action :user_signed

  def index
    user = User.find(current_user.id)
    @tweet = user.tweets
  end

  private

  def user_signed
    redirect_to new_user_session_path unless user_signed_in?
  end
end
