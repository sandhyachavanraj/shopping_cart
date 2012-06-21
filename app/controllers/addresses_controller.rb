class AddressesController < ApplicationController
  layout "products"

  before_filter :logged_in, :only => [:edit]

  def index
    @addresses = Address.all
  end
  
  def new
    @addresses = Address.new
    @addresses= current_user.user_profile
  end


end
