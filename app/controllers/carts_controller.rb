class CartsController < ApplicationController

	def new
		@cart = Cart.new
	end

  def index
		@carts = Cart.all   
  end
  
  def create
    @cart = Cart.find_or_create_by_user_id(current_user.id)
     redirect_to :login
    @cart.product_ids = params[:id].split(',').collect{|n| n.to_i}
   flash[:notice] = "First User must Login"
  end
end


