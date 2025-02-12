class SessionsController < ApplicationController

  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # ログイン成功
      # session[:user_id] = user.idを書き換え
      log_in(user)
      flash[:notice] = t(".created")
      redirect_to tasks_path
    else
      # ログイン失敗
      flash.now[:danger] = t(".failed")
      render :new

    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = t(".destroyed")
    redirect_to new_session_path
  end

end
