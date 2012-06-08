class ApplicationController < ActionController::Base

  protect_from_forgery 
  
  helper_method :current_user, :logged_in
  
  
  def current_user   
    @current_user ||= User.find session[:user].id if session[:user]   
  end
  
  def logged_in?
    current_user != nil
  end

  protected
  def logged_in
    redirect_to login_users_path
  end


  
end



