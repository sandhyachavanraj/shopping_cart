class UserProfile < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, :as => :adr , :dependent => :destroy
  accepts_nested_attributes_for :addresses ,:allow_destroy => true
#validates :image, :uniqueness => true
#  attr_accessible :addresses_attributes
#attr_accessor :created_by
  def upload_image=(upload)
    self.image_url = upload.original_filename.to_s
    self.content_type = upload.content_type.chomp
    directory = "app/assets/images"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end








  
  
end
