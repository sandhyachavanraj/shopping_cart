class Address < ActiveRecord::Base
  belongs_to :adr , :polymorphic => true

  belongs_to :user
  belongs_to :user_profile
#  validates  :mobile_number ,:presence => true, :numericality => true
#  validates  :address ,:presence => true
end