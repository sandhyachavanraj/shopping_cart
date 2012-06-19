class UserMailer < ActionMailer::Base
  default :from => "sandhya@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://gmail.com/login"
    mail(:to => user.email, :subject => "Welcome to Gmail")
  end
end
