class CartsController < ApplicationController

  layout 'products'
before_filter :logged_in, :unless => :logged_in?

  def new
    @cart = Cart.new
  end

  def index
    @carts = Cart.all
  end
  
  def create    
    @cart = Cart.find_or_create_by_user_id(current_user.id) 
    @cart.product_ids = params[:id].split(',').collect{|n| n.to_i}
    render :nothing=>true
  end

  def show
    @cart = Cart.find_by_id(current_user.cart.id)    
  end
end


