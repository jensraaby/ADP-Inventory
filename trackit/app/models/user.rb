class User < ActiveRecord::Base
  attr_accessible :active, :displayName, :givenName, :mail, :sAMAccountName, :sn, :telephoneNumber, :userPrincipalName

  has_many :registrations
  
  has_paper_trail
end
