class UsersController < ApplicationController
  layout 'products'
  before_filter :logged_in, :only => [:edit]

  
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
    #    raise params.inspect
    if @user.save!
      flash[:notice] = "user saved successfully"
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
    @user.cleanup
    flash[:notice] = "Successfully Destroyed"
    @user.destroy
    redirect_to users_path
  end

  
  def authenticate
    login = User.authenticate(params[:email], params[:password])
    if login
      session[:user] = login      
      flash[:notice] = "logged in suceesfully"
      redirect_to  products_path
      
    else
      flash[:notice] = "incoreect email/password"
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
        redirect_to :action => :reset_password
      end
    else
      flash[:notice] = "user is not available please create ur account"
      redirect_to login_users_path
    end
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
    @userprofile = UserProfile.find params[:id]
  end
  
  def upload_file
    raise params[:upload].inspect
    UserProfile.save(params[:upload])    
    render :text => "File has been uploaded successfully"
  end
  
  
  
  private

  def logged_in
    redirect_to login_users_path unless session[:user]
  end
  
    
end