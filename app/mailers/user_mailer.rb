class UserMailer < ApplicationMailer
  def welcome_send(user)
    @user = user
    mail to: user.email, subject: "Welcome to our site.", from: "info@ex.com"
  end
end
