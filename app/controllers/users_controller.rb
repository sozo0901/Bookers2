class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
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

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
