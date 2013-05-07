# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ws = Workstation.create([ {name: 'cph41raabyj', OS: 'OS X 10.8.3 (12D78)', model: 'MacBookPro4,1', serial: 'W88200AUYJY'} ])
ujpr = User.create()
ujpr.displayName = "Jens Raaby"
ujpr.sAMAccountName = "raabyj"
ujpr.mail = "jens.raaby@adpeople.com"
ujpr.telephoneNumber = "4151"
ujpr.save()

