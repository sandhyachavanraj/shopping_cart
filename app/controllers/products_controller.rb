class ProductsController < ApplicationController

  layout "products"

  before_filter :logged_in, :unless => :logged_in?
  

  def index
   return @products = User.find(params[:user_id]).products unless params[:user_id].blank?
    @products = Product.all
    @products=Product.paginate(:per_page => 12, :page => params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])    
    @product.user_id = session[:user].id
    
    if @product.save
      flash[:notice] = "New prduct is created and saved successfully"
      redirect_to products_path
    else
      flash[:notice] = "New prduct is  not created "
      render new_product_path
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]    
    if @product.update_attributes(params[:product])
      flash[:notice] = "Updated Successfully"
      redirect_to products_path
    else
      render edit_product_path
    end
  end

  def show    
    @product = Product.find params[:id]    
  end

  def destroy
    @product = Product.find params[:id]
     @product.destroy
    flash[:notice] = "Successfully Destroyed"
   
    redirect_to products_path
  end 

  def upload_file
    Product.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  
end
