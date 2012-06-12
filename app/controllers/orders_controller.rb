class OrdersController < ApplicationController
  layout "products"

  before_filter :logged_in, :only => [:edit]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create    
    @order = Order.new(params[:order])
    @order.user_id = current_user.id   
    current_user.cart.cart_items.each do |item|    
      @order.amount = item.quantity * item.product.price       
    end
    
    if @order.save
      flash[:notice] = "user saved successfully"
      redirect_to orders_path
    else
      render new_order_path
    end
     
    
  end
end
