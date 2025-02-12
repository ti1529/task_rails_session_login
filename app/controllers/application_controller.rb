class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :login_required

  private

  # ログインしていないと、アクセスできなくする
  def login_required
    # redirect_to new_session_path unless current_user
    unless current_user
      flash[:notice] = "ログインしてください"
      redirect_to new_session_path
    end
  end



end
