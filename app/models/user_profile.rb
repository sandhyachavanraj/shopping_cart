class UserProfile < ActiveRecord::Base
  belongs_to :user
  
  #  has_many :addresses, :as => :adr, :dependent => :destroy
  # validates :image_url, :presence => true
  #  accepts_nested_attributes_for :addresses ,:allow_destroy => true

  has_one :billing_address, :as => :adr, :class_name => "Address"
  has_one :shipping_address, :as => :adr, :class_name => "Address"

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
