class TweetsController < ApplicationController
#before_action :form_params, only: :show

  def index
    @tweets = Tweet.includes(:user)
    @comments = Comment.includes(:tweet)
    @members = Member.includes(:tweet)
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
  end

private

def form_params
  params.permit(:prefecture, :place, :start_time, :title, :comment, :image, :images, :wanted_list, :item_image).merge(user_id: current_user.id, tweet_id: params[:id])
end

end
