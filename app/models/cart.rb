class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, :through => :cart_items


  class TemporaryCart < Cart

  def initialize session
    @session = session[:user]
  end

  def add_item

    @session[:temporary_cart][:num_items] += 1
  end
end



end
