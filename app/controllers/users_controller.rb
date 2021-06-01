class UsersController < ApplicationController
  include SessionsHelper

  def index
    @users = User.page(params[:pages]).per(4)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = '質問投稿サイトにようこそ!'
      log_in @user
      redirect_to new_question_path
    else
      render action: :new
    end
  end

  def guest_login
    user = User.find_or_create_by!(email: 'quest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    log_in user
    redirect_to new_question_path, notice: 'ゲストユーザーとしてログインしました'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
