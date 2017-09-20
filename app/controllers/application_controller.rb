class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Concerns::UserSession

  private

  def auth_user
    unless logged_in?
      flash[:notice] = '请登录'
      redirect_to new_session_path
    end
  end

end
