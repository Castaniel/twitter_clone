class TweetsController < ApplicationController
  before_action :correct_user, only: :destroy
  
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def tweet_params
    params.require(:tweet).permit(:text)
  end
  
  def correct_user
    @tweet = current_user.tweets.find_by(id: params[:id])
    redirect_to root_path if @tweet.nil?
  end
end
