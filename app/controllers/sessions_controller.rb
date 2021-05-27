class SessionsController < ApplicationController
	include SessionsHelper

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'ログインに成功しました'
      redirect_to questions_path
    else
      flash[:alert] = "メールアドレスかパスワードが間違っています"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
