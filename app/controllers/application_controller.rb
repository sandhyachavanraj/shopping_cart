class ApplicationController < ActionController::Base
  protect_from_forgery 
  #layout :change_layout
  helper_method :current_user, :logged_in
  
  
  def current_user
    @current_user ||= User.find session[:user].id if session[:user]
  end
  
  def logged_in?
    current_user != nil
  end    

  def change_layout
    if current_user && current_user.admin
      "admin"
    else
      "products"
    end
  end
end
