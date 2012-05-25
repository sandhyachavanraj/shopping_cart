class CategoriesController < ApplicationController


  def index
		@categories = Category.all
  end

	def new
		@category = Category.new
	end

  def create
    @category = Category.new   
    @category.products.build(params[:product])
    if @category.save
      flash[:notice] = "category saved successfully"
      redirect_to :action => :index
    else
      render :new
    end
  end

 
end
