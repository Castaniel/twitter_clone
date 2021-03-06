class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  
  def index
    @users = User.search(params[:search]).page(params[:page]).per_page(5)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :search)
  end
  
  def correct_user
    @user = User.find(params[:id])
    flash[:success] = "Wrong user"
    redirect_to(root_url) unless current_user?(@user)
  end
end
