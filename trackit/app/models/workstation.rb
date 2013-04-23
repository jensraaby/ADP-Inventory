class Workstation < ActiveRecord::Base
  attr_accessible :serial, :OS, :information, :model, :name
  
  store :information, accessors: [ :last_seen, :primary_user_id ]
  
  # This lets you assign the workstation in a registration:
  has_many :registrations, :as => :device
  
  has_paper_trail
  
  # Define methods for individual devices here
end
