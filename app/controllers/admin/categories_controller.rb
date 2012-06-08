class Admin::CategoriesController < ApplicationController
  layout 'admin'
  

  def index
		@categories = Category.all
  end

	def new
		@category = Category.new
	end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "category saved successfully"
      redirect_to admin_categories_path
    else
      render new_admin_category_path
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update   
    @category = Category.find params[:id]
    if @category.update_attributes(params[:category])
      flash[:notice] = "Success"
      redirect_to admin_categories_path
    else
      render edit_admin_category_path

    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    flash[:notice] = "Successfully Destroyed"
    redirect_to admin_categories_path
  end

  def list
    @category = Category.find params[:id]
    @products = @category.products
  end



 


end
