class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  def destroy
    @comment = Comment.find(params[:tweet_id])
    @comment.destroy
    redirect_to "/tweets/#{@comment.tweet_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
