class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :name,:price,:description, :presence => true

  def upload_image=(upload)
     self.image_url = upload.original_filename.to_s     
    directory = "app/assets/images/products"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

end
