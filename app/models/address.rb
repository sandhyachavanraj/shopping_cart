class Address < ActiveRecord::Base
  belongs_to :adr , :polymorphic => true

  belongs_to :user
  belongs_to :user_profile
# validates  :mobile_number ,:presence => true, :numericality => {:only_integer => true,:case_sensitive => false, :message => "Duplicasy is not allowed" },:length => { :is => 10,:too_short => "must have at least %{count} words",
#   :too_long  => "must have at most %{count} words" }
#  validates  :address , :allow_blank => false
#  validates  :phone_number,:presence => true,:numericality => {:only_integer => true,:case_sensitive => false,:message => "Duplicasy is not allowed"},:length => { :is => 6 ,:too_short => "must have at least %{count} words",
#   :too_long  => "must have at most %{count} words"}
#attr_accessor :mobile_number, :phone_number






#def phone_field_tag(name, value = nil, options = {})
#
#  text_field_tag(name, value, options.stringify_keys.update("type" => "phone"))
#end
#
#
#
#def mobile_field_tag(name, value = nil, option ={})
#    text_field_tag(name, value , options.stringfy_keys.update("type" => "mobile"))
#end

end