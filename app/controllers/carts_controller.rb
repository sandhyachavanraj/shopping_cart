class CartsController < ApplicationController

  def new
    @cart = Cart.new
  end

  def index
    @carts = Cart.all
  end
  
  def create
    @cart = Cart.find_or_create_by_user_id(current_user.id)
    @cart.product_ids = params[:id].split(',').collect{|n| n.to_i}   
  end

  def show
    @cart = Cart.find_by_id(current_user.cart.id)    
  end
end


