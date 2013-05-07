require "bundler/capistrano" 
load 'deploy/assets'

set :hostname, "152.146.38.56"
set :application, "trackit"
set :repository,  "https://github.com/jensraaby/ADP-Inventory.git"
set :user, "xadmin"
set :deploy_to, "/Volumes/MacSupportMirror/TrackIT/deploy"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, hostname                        # Your HTTP server, Apache/etc
role :app, hostname                          # This may be the same as your `Web` server
role :db,  hostname, :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :rails_env, :production
set :branch, 'master'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end
  
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end