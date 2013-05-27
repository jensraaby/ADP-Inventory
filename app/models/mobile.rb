class Mobile < ActiveRecord::Base
  attr_accessible :ICCID, :IMEI, :OS, :information, :model, :name, :serial, :phone_number
  
  # Add fields to the accessors array to store them in the hash
  store :information, accessors: [ :last_seen, :primary_user_id ]
  
  has_many :registrations, :as => :device
  
  has_paper_trail
end
