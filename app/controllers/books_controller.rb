class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :is_maching_login_user, only:[:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    is_maching_login_user
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_maching_login_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

end
