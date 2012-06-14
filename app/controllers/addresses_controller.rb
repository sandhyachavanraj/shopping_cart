class AddressesController < ApplicationController
  layout "products"

  before_filter :logged_in, :only => [:edit]

  def index
    @addresses = Address.all
  end
  
  def new
    @address = Address.new
     @addresses= current_user.user_profile
  end

  def create
    @address = Address.new(params[:address])  

    if @address.save
      flash[:notice] = "user saved successfully"
      redirect_to addresses_path
    else
      render new_address_path
    end
  end
  def upload_image
    Address.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
