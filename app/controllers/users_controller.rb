class UsersController < ApplicationController

  def new
    @user = User.new
    @book = Book.new
  end

  def create
    @user = User.new
    @user.user_ = current_user.id
    @user.save
    redirect_to user_path
  end

  def index
    @users = User.all
    @books = Book.all

  end

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books = @user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end

    private

    def user_params
      params.require(:user).permit(:name,:introduction)
    end

end
