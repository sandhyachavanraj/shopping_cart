class UsersController < ApplicationController

  layout "products"

 
  
  before_filter :logged_in, :only => [:edit]
  
  def index

    @users = User.all

    @users = User.paginate(:page => params[:page], :per_page => 8)
  end


  def new
    @user = User.new

   
  end

  def create
    #    @user = UserProfile.new
    #    @user.build_user(params[:user])
    #    #    raise params.inspect
    #    if @user.save!
    #      flash[:notice] = "user saved successfully"
    #      redirect_to users_path
    #    else
    #      render new_user_path
    #    end
    @user = User.new(params[:user])
    if @user.save      
      flash[:notice] = 'success'
      redirect_to users_path
    else
      render new_user_path

    end
  
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:notice] = "Success"
      redirect_to users_path
    else
      render edit_user_path
    end
  end

  def show
    @user = User.find params[:id]
  end
  
  def destroy
    @user = User.find params[:id]
    #@user.cleanup
    flash[:notice] = "Successfully Destroyed"
    @user.destroy
    redirect_to users_path
  end

  
  def authenticate   
    login = User.authenticate(params[:email], params[:password])
    if (login )
      session[:user] = login      
      flash[:notice] = "logged in suceesfully"
      if current_user.admin == true
        redirect_to  admin_users_path
      else
        redirect_to  users_path
      end
    else
      flash[:notice] = "Incorrect Email/Password"
      redirect_to login_users_path
    end
  end

  def logout
    reset_session
    flash[:notice] = "log out successfully"
    redirect_to users_path
    
  end

  def update_password
    @user = User.find_by_id_and_password(session[:user].id, params[:old_password])

    if @user
      flash[:notice] ="user available"
      
      if User.update_password(params[:password], params[:confirm_password])
        @user.password = params[:password]
        @user.save!

        flash[:notice] = "Successfully Updated"
        redirect_to users_path
      else
        flash[:notice] = "password mismatch"
        redirect_to reset_password_path
      end
    else
      flash[:notice] = "user is not available please create ur account"
      redirect_to login_users_path
    end
  end

  def profile
    @user = User.find params[:id]
    @user_profile = @user.user_profile
    @addresses = @user_profile.addresses
  end

  def update_profile    
    @user_profile = UserProfile.find_by_user_id(params[:id])

    if @user_profile.update_attributes(params[:user_profile])
      
      flash[:notice] = "Success"
      redirect_to users_path
    else
      flash[:notice] = "userprofile not saved"

      render :profile

    end
  end

  def userprofilelist
    #    raise params[:id].inspect
    @userprofile = UserProfile.find_by_user_id(params[:id])
  end
  
  def upload_file
    UserProfile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

 
  private

  def logged_in
    redirect_to login_users_path unless session[:user]

  end

  
   
end