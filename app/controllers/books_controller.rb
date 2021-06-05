class BooksController < ApplicationController


  def new
  end


  def index
    @books = Book.new
  end

  def show
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end






  private
  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end

end
