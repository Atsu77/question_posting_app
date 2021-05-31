class Admin::SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      check_admin
      flash[:notice] = 'ログインに成功しました'
      redirect_to questions_path
    else
      flash[:alert] = 'メールアドレスかパスワードが間違っています'
      render action: :new
    end
  end

  private

  def check_admin
    unless current_user.admin?
      render action: :new
      flash[:alert] = '権限がありません'
    end
  end
end
