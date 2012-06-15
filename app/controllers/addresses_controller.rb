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

#  def create
#    @address = Address.new(params[:address])
#
#    if @address.save
#      flash[:notice] = "user saved successfully"
#      redirect_to users_path
#    else
#      render new_address_path
#    end
#  end

end
