class TweetsController < ApplicationController
  before_action :correct_user, only: :destroy
  
  def index
    #@tweets = Tweet.all
    @tweets = Tweet.order("id").page(params[:page]).per_page(5)
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    #flash[:success] = "Micropost deleted"
    redirect_to root_path
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
