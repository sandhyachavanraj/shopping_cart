class CategoriesController < ApplicationController

before_filter :logged_in, :unless => :logged_in?

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
      redirect_to :action => :index
    else
      render :new
    end
  end

  private

  def logged_in
    redirect_to login_users_path
  end
 
end
