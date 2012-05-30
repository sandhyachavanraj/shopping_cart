class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :cart_items
  has_many :carts, :through => :cart_items  

  validates :name, :description, :price, :presence => true
  validates :price, :numericality => true
  validates :name, :uniqueness => true
  validates :image_url, :format => { :with=> %r{\.(gif|jpg|png)$}i,:message => 'must be a URL for GIF, JPG or PNG image.'}

  

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
