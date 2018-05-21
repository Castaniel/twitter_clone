class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:id])
  end
end
