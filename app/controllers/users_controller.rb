class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end


end
