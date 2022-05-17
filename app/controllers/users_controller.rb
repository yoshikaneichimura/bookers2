class UsersController < ApplicationController

  def show
    @user=find(params[:id])
    @book=@user.book
  end

  def edit
    @user=find(params[:id])
  end

  def update
    user=User.find(params[:id])
    user.update(user_params)
    redilect_to books_path(book.id)
  end
    private

    def user_params
      params.require(:book).permit(:name,:introduction)
    end
end
