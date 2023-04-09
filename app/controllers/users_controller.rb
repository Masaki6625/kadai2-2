class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    #is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    #is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="successfully"
      redirect_to user_path(current_user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def followings
    @followings = @user.following_users
  end

  def followers
    @followers = @user.follower_users
  end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
