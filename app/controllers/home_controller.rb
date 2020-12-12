class HomeController < ApplicationController
  before_action :basic_auth

  def index
    if user_signed_in?
      redirect_to tweets_path(current_user.id)
    end
  end

  def show
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
