class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:username],params[:password])
    if @user
      login_user @user
      # flash[:notice] = "登录成功"
      # redirect_to root_path
      render json: {
                 status: 'ok',
                 msg: {
                     redirect_url: root_path
                 }
             }
    else
      # flash[:notice] = "用户名或密码不正确"
      # render action: :new
      render json: {
                 status: 'error',
                 msg: "用户名或密码不正确"
             }
    end
  end

  def destroy
    logout_user

    flash[:notice] = "退出成功"
    redirect_to new_session_path
  end
end
