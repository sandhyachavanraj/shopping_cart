class UserMailer < ActionMailer::Base

     
  default :from => "shashank.agarwal@sumerusolutions.com"
  def welcome_user(user)
    @user = user
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Welcome")
  end


end

