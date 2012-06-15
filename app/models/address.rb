class Address < ActiveRecord::Base
  belongs_to :adr , :polymorphic => true
  belongs_to :user
  belongs_to :user_profile


 # validates  :mobile_number ,:presence => true, :numericality => {:only_integer => true,:case_sensitive => false, :message => "Duplicasy is not allowed" },:length => { :is => 10,:too_short => "must have at least %{count} words",
              #  :too_long  => "must have at most %{count} words" },:inclusion => { :in => %w(0 1 2 3 4 5 6 7 8 9 ),:message => "%{value} is not a valid number" }
  #validates  :address , :allow_blank => false
  #validates  :phone_number,:presence => true,:numericality => {:only_integer => true,:case_sensitive => false,:message => "Duplicasy is not allowed"},:length => { :is => 6 ,:too_short => "must have at least %{count} words",
              # :too_long  => "must have at most %{count} words"},:inclusion => { :in => %w(0 1 2 3 4 5 6 7 8 9 ), :message => "%{value} is not a valid number" }


end