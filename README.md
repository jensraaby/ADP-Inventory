ADP-Inventory
=============

IT inventory tracker. 

The basic idea is to maintain a list of all devices and users in our organisation. 
The Rails app provieds data persistence with an SQL database, a web interface (using plain old HTML with Bootstrap CSS at present) and basic data export.

Prerequisites
============
- RVM (the rvmrc file will install the correct Ruby and create a gemset)
- SQLite for development. PostgreSQL for production 

Installation
============
1. Clone the repository
2. Install bundler (cd into the repository, run 'gem install bundler')
3. Install the bundle (cd into the trackit folder, run 'bundle install')
4. Run the development server: 'rails server'
5. Open http://localhost:3000/

Development
===========
It's a standard Rails 3 app. Most of the useful stuff is in the 'trackit/app' folder.
Tip: run 'rails console' and you can manipulate models/test methods interactively.
