class Admin::UsersController < ApplicationController
  layout "admin"

  before_filter :logged_in, :unless => :logged_in?

  def index
    @users = User.all
    @users = User.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @user = User.new
  end

  def create
    @user = UserProfile.new
    @user.build_user(params[:user])    
    if @user.save!
      flash[:notice] = "user saved successfully"
      redirect_to admin_users_path
    else
      render new_admin_user_path
    end
  end

  def edit
    @user = User.find params[:id]
    
  end

  def update    
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:notice] = "Success"     
      redirect_to admin_path
    else
      render edit_admin_user_path
    
    end
  end

  def show    
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find params[:id]
    # @user.cleanup
    flash[:notice] = "Successfully Destroyed"
    @user.destroy
    redirect_to admin_users_path
  end

  def user_profile
    @user = User.find params[:id]
    @user_profile = @user.user_profile
  end

  def update_profile

    @user_profile = UserProfile.find_by_id(params[:id])

    if @user_profile.update_attributes(params[:user_profile])
      flash[:notice] = "Success"
      redirect_to users_path
    else
      flash[:notice] = "userprofile not saved"
      render :edit_profile


    end
  end


  def userprofilelist
    @userprofile = UserProfile.find_by_user_id( params[:id])
  end


   private

  def logged_in
    redirect_to login_users_path unless session[:user]

  end


end
