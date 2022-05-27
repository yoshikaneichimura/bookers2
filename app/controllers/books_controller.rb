class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "successfully!!"
     redirect_to book_path(@book.id)
    else
     @book = Book.all
     render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "successfully!!"
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book.id)
  end

  private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end


end



