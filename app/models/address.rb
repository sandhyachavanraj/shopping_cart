class Address < ActiveRecord::Base
  belongs_to :adr , :polymorphic => true
  belongs_to :user_profile

  validates :state, :country, :presence => true, :format => {:with => /^[a-z]+$/, :message => " can only contain characters" }
  validates :zipcode,:presence => true, :length => { :in => 5..7 }, :numericality => { :only_integer => true }
  validates :mobile_number,:phone_number,  :presence => true,:uniqueness => true
  validates :phone_number, :length => {:in => 6..10}, :numericality => { :only_integer => true }
  validates :mobile_number, :length => {:is => 10}, :numericality => { :only_integer => true },:presence => true
  
end