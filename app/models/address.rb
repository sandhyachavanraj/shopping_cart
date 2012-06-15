class Address < ActiveRecord::Base
  belongs_to :adr , :polymorphic => true
  belongs_to :user
  belongs_to :user_profile

  validates :mobile_number,:phone_number,:address, :adr_type, :presence => true
  validates :phone_number, :length => {:in => 6..10}, :numericality => { :only_integer => true }
  validates :mobile_number, :length => {:is => 10}, :numericality => { :only_integer => true }
end