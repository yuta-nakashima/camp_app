class TweetsController < ApplicationController
before_action :user_signed
before_action :tweets_params, only: [:show, :edit, :update, :destroy]

  def index
    user = User.find(current_user.id)
    #tweets = Tweet.with_attached_image
    @tweets = user.tweets.order(id: "DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.save!
    if @tweet.valid?
       redirect_to tweets_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @tweet.user.id == current_user.id
      @tweet.destroy
      redirect_to tweets_path(current_user.id)
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit( :title, :start_time, :image, :item_image, :prefecture_id, :place,  :wanted_list, images: []).merge(user_id: current_user.id)
  end

  def tweets_params
    @tweet = Tweet.find(params[:id])
  end

  def user_signed
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
