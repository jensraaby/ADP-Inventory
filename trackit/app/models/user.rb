class User < ActiveRecord::Base
  attr_accessible :active, :displayName, :givenName, :mail, :sAMAccountName, :sn, :telephoneNumber, :userPrincipalName

  # you can call user.registrations to get an array of all ther registrations
  has_many :registrations
  
  # every update is tracked with paper_trail gem. including destroy
  has_paper_trail
  
  validates :mail, :uniqueness => true
  
  validates :mail, :presence => true
  validates :sAMAccountName, :presence => true
  validates :displayName, :presence => true  
  
  # In case some values are not set, we can fill them in automatically
  after_initialize :set_defaults
  def set_defaults
    self.active = true if (self.active.nil?)
  end
  
  # Helper method creates an association with a device
  def register_device(device)
    r = Registration.create()
    r.device = device
    r.user = self
    r.save()
  end
  
  # most functionality should go in a controller, not here! Separation of concerns :)
  
  
end
