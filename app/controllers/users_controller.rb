class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, except: [:top, :about]
  def show
    @book =Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def index
  	@users = User.all
  end
# email追加してみた
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end
end