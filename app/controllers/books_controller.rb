class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
