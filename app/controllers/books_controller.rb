class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end
    
  def index
    @book = Book.new
  end

  def show
  end

  def edit
  end
  
  private
  
  def book_params
    params.requite(:book).permit(:title, :body)
  end
end
