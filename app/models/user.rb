class User < ActiveRecord::Base
  has_one :user_profile
  has_many :products
  has_one :cart
  has_many :orders 
 
  #has_one :address , :as => :billing_address
 


  validates :name, :presence => true,  :format => {:with => /^[a-z0-9]{4}+[-a-z0-9]*[a-z0-9]+$/i }

  validates :email, :presence => true,
    :length => {:minimum => 3, :maximum => 254},

    :format => {:with => /^([^@\s]{3,10}+)@((?:[-a-z0-9]{4,8}+\.)+[a-z]{2,4})$/i}


  validates :password, :presence =>true, :confirmation =>true, :length => { :minimum => 5, :maximum => 12}
  validates :password_confirmation, :presence => true,  :if => :password_changed?
  
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

end



 
