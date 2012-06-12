class CartItemsController < ApplicationController
       layout "products"
  def new
    @cart_item = CartItem.new
  end

  def index
    @cart_items = CartItem.all
  end

  def create  
    @cart_item = CartItem.new(params[:cart_item])    
    @cart_item = Cart.find params[:id]
    if @cart_item.save
      flash[:notice] = "cart_item saved successfully"
      redirect_to cart_items_path
    else
      flash[:notice] = "not saved"
    end
  end

  def show
    @cart_item = CartItem.find params[:id]
  end
  
  def delete_items
    current_user.cart.cart_items.destroy_all
      
  end

  def update
    @cart_item= CartItem.find params[:id]
    if @cart_item.update_attributes(params[:cart_item])
      flash[:notice] = "Updated Successfully"
      redirect_to cart_item_path
    else
      render edit_cart_item_path
    end
  end

  
end
