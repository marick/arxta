set :application, "arxta"
set :scm, :git
set :repository,  "git://github.com/marick/arxta.git"

set :deploy_to, "/home/giantmi/arxta-deployments"

set :user, 'giantmi'
set :use_sudo, false

role :app, "giantmicrobefans.com"
