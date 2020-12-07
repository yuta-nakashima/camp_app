class TweetsController < ApplicationController
before_action :form_params, only: :show

  def index
    user = User.find(current_user.id)
    @tweets = user.tweets
    @members = user.members
    @comments = user.comments
  end

  def new
    @tweet = Form.new
  end

  def create
    @tweet = Form.new(form_params)
    if @tweet.valid?
       @tweet.save
       redirect_to tweets_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @prefecture = Prefecture.find(params[:id])
  end

def edit
end

private

def form_params
  params.permit(:prefecture, :place, :start_time, :title, :comment, :image, :images, :wanted_list, :item_image).merge(user_id: current_user.id, tweet_id: params[:id])
end

end
