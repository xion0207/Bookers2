class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @edit = current_user
    if @edit != User.find(params[:id])
    redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "successfully"
    redirect_to user_path
    else
      render :edit
    end
  end

  def users

    @users = User.all
    @user = current_user
    @book = Book.new
  end

  private


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
