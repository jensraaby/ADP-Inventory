class Registration < ActiveRecord::Base
  attr_accessible :active, :device_id, :device_type
  
  validates :active, :presence => true
  
  # Sets up a polymorphic relationship (device_type and device_id)
  belongs_to :device, :polymorphic => true
  
  # A normal relationship (adds user_id column)
  belongs_to :user
  
  has_paper_trail
  
  # Perhaps it is useful to find all the current and past registrations?
  scope :current, :conditions => ['active = ?', true]
  scope :inactive, :conditions => ['active = ?', false]
  
  
  # In case some values are not set, we can fill them in automatically
  after_initialize :set_defaults
  def set_defaults
    # puts setting active boolean
    self.active = true if (self.active.nil?)
  end
  
end
