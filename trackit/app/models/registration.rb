class Registration < ActiveRecord::Base
  attr_accessible :active, :device_id, :device_type
  
  # Sets up a polymorphic relationship (device_type and device_id)
  belongs_to :device, :polymorphic => true
  
  # A normal relationship (adds user_id column)
  belongs_to :user
  
  has_paper_trail
  
  # Perhaps it is useful to find all the current and past registrations?
  scope :current, :conditions => ['active = ?', true]
  scope :inactive, :conditions => ['active = ?', false]
  
end
