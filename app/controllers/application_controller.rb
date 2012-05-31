class ApplicationController < ActionController::Base
  protect_from_forgery 
  helper_method :current_user, :logged_in

  def current_user
    @current_user ||= User.find session[:user].id if session[:user]
  end

  layout "change_layout"
protected
 
  def change_layout

    if current_user.admin?
      render :layout => "admin"
    else
      render :layout => "products"
    end
  end

  def logged_in?
    current_user != nil
  end

end
