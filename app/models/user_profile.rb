class UserProfile < ActiveRecord::Base
  belongs_to :user
  has_many :addresses, :as => :address



  def upload_image=(upload)
    self.image_url = upload.original_filename.to_s
    self.content_type = upload.content_type.chomp
    directory = "app/assets/images"
    path = File.join(directory, upload.original_filename)
    File.open(path, "wb") { |f| f.write(upload.read) }
  end

  
  
end
