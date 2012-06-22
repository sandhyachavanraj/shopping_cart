class Order < ActiveRecord::Base
  belongs_to :user
#  has_one :address, :as => :billing_address
  validates :firstname, :lastname, :presence => true, :length => { :maximum => 20 }
  
  

  
end
