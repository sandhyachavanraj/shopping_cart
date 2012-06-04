class User < ActiveRecord::Base
  has_one :user_profile
  has_many :products
  has_one :cart

  validates :name, :presence => true
  validates :password, :presence =>true, :confirmation =>true, :length => { :minimum => 5, :maximum => 8}
  validates :email, :presence => true,
    :format => {:with =>  /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :message => "testststs" }
  attr_accessor :confirm_password, :old_password

  #  validate :old_password,:if => Proc.new{|x| (errors.add(:base,"sdfsfdsdf");return self) if !x.old_password.blank?}
  

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

end
 

 
