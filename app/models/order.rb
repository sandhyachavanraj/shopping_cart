class Order < ActiveRecord::Base
  belongs_to :user

#  validates :firstname, :lastname, :address_line1, :address_line2, :state, :country, :zipcode, :presence => true
end
