class UserProfile < ActiveRecord::Base
  belongs_to :user

  #attr_accessible :address_attributes
  attr_accessor :adr

  has_one :billing_address, :as => :adr, :class_name => "Address",:dependent => :destroy
  has_one :permanent_address, :as => :adr, :class_name => "Address",:dependent => :destroy

  accepts_nested_attributes_for :billing_address, :permanent_address



  def upload_image=(upload)
    self.image_url = upload.original_filename.to_s
    self.content_type = upload.content_type.chomp
    directory = "app/assets/images"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
  def cleanup
    if File.exists?("#{Rails.root}/app/assets/images/#{self.image_url}")
      File.delete("#{Rails.root}/app/assets/images/#{self.image_url}")
    end
  end

 
end
