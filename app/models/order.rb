class Order < ActiveRecord::Base
  belongs_to :user

  validates :firstname, :lastname, :presence => true, :length => { :maximum => 20 }
  validates :address_line1, :address_line2,  :presence => true
  validates :state, :country, :presence => true, :format => {:with =>  /[a-z][A-Z]/, :message => " can only contain characters" }
  validates :zipcode,:presence => true, :length => { :in => 5..7 }, :numericality => { :only_integer => true }
  
end
