class UserProfile < ActiveRecord::Base
  belongs_to :user
  # has_attached_file :img, :styles => {:thumb => "100x100!" }

#   validates :content_type, :format => {:with => /^image/,:message => "--- you can only upload pictures"}, :on => :update
   
#   def uploaded_picture=(userprofile_field)
##    raise userprofile_field.content_type.inspect
#    self.name = base_part_of(userprofile_field.original_filename)
#    self.content_type = userprofile_field.content_type.chomp
#    self.data = userprofile_field.read
#  end
#
#  def base_part_of(file_name)
#    File.basename(file_name).gsub(/[^\w._-]/, '')
#  end

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
