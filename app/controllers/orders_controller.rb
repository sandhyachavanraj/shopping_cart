class OrdersController < ApplicationController
  layout "products"

  before_filter :logged_in, :only => [:edit]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @user_profile = current_user.user_profile
    @billing_address = current_user.user_profile.billing_address
    @shipping_address = current_user.user_profile.shipping_address
  end

  def create
    @order = Order.new(params[:order])    
    @order.user_id = current_user.id
    current_user.cart.cart_items.each do |item|   
      @order.amount += item.quantity * item.product.price      
    end
    if @order.save
      flash[:notice] = "user saved successfully"
      redirect_to orders_path
    else
      render new_order_path
    end
  end

  def update_profile
    @user_profile = UserProfile.find_by_user_id(params[:id])
    @billing_address = current_user.user_profile.billing_address.blank? ? current_user.user_profile.billing_address.new(params[:billing_address]) : current_user.user_profile.billing_address
    if @billing_address.new_record?
      res = @billing_address.save
    else
      @billing_address.update_attributes(params[:user_profile][:billing_addres])
    end
    if res
      flash[:notice] = "Success"
      redirect_to products_path
    else
      render :new
    end
  end
end
