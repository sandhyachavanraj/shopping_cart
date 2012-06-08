class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_filter :logged_in, :only => [:edit]

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

  def list
    @category = Category.find params[:id]
    @products = @category.products
  end
  private
  def logged_in
    redirect_to login_users_path
  end


end
