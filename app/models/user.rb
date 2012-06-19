class User < ActiveRecord::Base
  has_one :user_profile
  has_many :products
  has_one :cart
  has_many :orders 

  

  validates :name, :presence => true
  validates :password, :presence =>true, :confirmation =>true, :length => { :minimum => 5, :maximum => 12}
  validates :password_confirmation,:presence => true, :if => :password_changed?
  
  attr_accessor :confirm_password, :old_password



  before_save(:on => :create) do
    self.activation_code = SecureRandom.hex(13)    
  end
  

  def self.authenticate(email, password)
    find_by_email_and_password(email, password)
  end
 
  def self.update_password(password, confirm_password)
    password != confirm_password ? false : true
  end


  

  def self.userprofilelist(id)
    find_by_id(id)
  end

  def item_status
    return :no_such_item
  end

  def is_admin?
    self.admin == true ? true:false
  end

#  def active?
#  active
#end
#
#def activate!
#  self.active = true
#  save
#end
#
#def deactivate!
#  self.active = false
#  save
#end
#
#def send_activation_instructions!
#  reset_perishable_token!
#  Notifier.activation_instructions(self).deliver
#end
#
#def send_activation_confirmation!
#  reset_perishable_token!
#  Notifier.activation_confirmation(self).deliver
#end


end
 

 
