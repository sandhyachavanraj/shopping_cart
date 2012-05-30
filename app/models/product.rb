class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :cart_items
  has_many :carts, :through => :cart_items  


  validates :name,:price,:description, :presence => true

  def upload_image=(upload)
     self.image_url = upload.original_filename.to_s     
    directory = "app/assets/images/products"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

end
