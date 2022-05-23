class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.user_id = current_user.id
    @user.save
    redilect_to user_path

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
