class TweetsController < ApplicationController
  before_action :user_signed
  before_action :tweets_params, only: [:show, :edit, :update, :destroy]
  before_action :search_tweets, only: [:index, :search]

  def index
    user = User.find(current_user.id)
    @tweets = user.tweets.order(id: 'DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
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

  def search
    @results = @p.result.includes(:user)
    @tweets = Tweet.includes(:user)
  end

  def self.search(search)
    Tweet.where('place LIKE(?)', "%#{search}%") if serch != ''
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :start_time, :image, :item_image, :prefecture_id, :place, :wanted_list,
                                  memory_images: []).merge(user_id: current_user.id)
  end

  def tweets_params
    @tweet = Tweet.find(params[:id])
  end

  def user_signed
    redirect_to new_user_session_path unless user_signed_in?
  end

  def search_tweets
    @p = Tweet.ransack(params[:q])
  end
end
