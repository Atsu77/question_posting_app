class UsersController < ApplicationController
	include SessionsHelper

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "質問投稿サイトにようこそ!"
      log_in @user
      redirect_to new_question_path
    else
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
