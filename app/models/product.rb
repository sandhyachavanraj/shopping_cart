class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :cart_items
  has_many :carts, :through => :cart_items 

  def upload_image=(upload)
    self.image_url = upload.original_filename.to_s
    directory = "app/assets/images/products"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  def cleanup
    if File.exists?("#{Rails.root}/app/assets/images/#{self.image_url}")
      File.delete("#{Rails.root}/app/assets/images/#{self.image_url}")
    end
  end

end
