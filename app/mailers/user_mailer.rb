class UserMailer < ApplicationMailer
  # 注册邮件
  def sign_up user
    @user = user
    mail to: @user.email_address, subject: "Welcome #{@user.username}"
  end
end
