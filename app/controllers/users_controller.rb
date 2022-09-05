class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
    @user = current_user
    @books = Book.all
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to users_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user.id)
    end
  end
end
