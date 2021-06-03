class UsersController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
  end

  def show
  end

  def edit
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end


end
