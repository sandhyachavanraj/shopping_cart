class Address < ActiveRecord::Base
  belongs_to :address, :polymorphic => true

  belongs_to :user
  belongs_to :user_profile
  
 
end
