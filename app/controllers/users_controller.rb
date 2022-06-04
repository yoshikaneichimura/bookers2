class UsersController < ApplicationController

  def new
    @user = User.new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "successfull!!"
     redirect_to book_path(book.id)
    else
     render :edit
    end

    @user = User.new(user_params)
    @user.id = current_user.id
    if @user.save
     flash[:notice] = "successfull!!"
     redirect_to user_edit(book.id)
    else
     render :edit
    end

  end

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new

  end

  def show
    @user=User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
     @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.id = current_user.id
     if @user.update(user_params)
    flash[:notice] = "successfully!!"
    redirect_to user_path
     else
    render :edit
     end

  end

    private

    def user_params
      params.require(:user).permit(:name,:introduction,:profile_image)
    end

end
