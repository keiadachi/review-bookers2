class BooksController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
  end


  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @books = Book.find(params[:id])
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def destroy
    @book.destroy
     redirect_to books_path

  end


  private
    def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
    end

    def ensure_correct_user
      @book = Book.find(params[:id])
      unless @book.user == current_user
        redirect_to books_path
      end
    end

end
