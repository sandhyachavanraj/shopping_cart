class Address < ActiveRecord::Base
  
  belongs_to :user_profile


  validates :state, :country, :presence => true, :format => {:with => /^[a-z]+$/, :message => " can only contain characters" }
  validates :address_line1, :address_line2, :presence => true
  validates :zipcode,:presence => true, :length => { :in => 5..7 }, :numericality => { :only_integer => true }
  validates :phone_number, :presence => true, :length => {:in => 6..10}, :numericality => { :only_integer => true }
  validates :mobile_number, :presence => true, :length => {:is => 10}, :numericality => { :only_integer => true }

end
