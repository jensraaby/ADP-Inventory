class User < ActiveRecord::Base
  attr_accessible :active, :displayName, :givenName, :mail, :sAMAccountName, :sn, :telephoneNumber, :userPrincipalName

  # you can call user.registrations to get an array of all ther registrations
  has_many :registrations
  
  # every update is tracked with paper_trail gem. including destroy
  has_paper_trail
  
  # functionality should go in a controller, not here! Separation of concerns :)
end
