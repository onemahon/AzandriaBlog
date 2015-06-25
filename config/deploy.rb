lock "3.4.0"

set :application, "blaugh"
set :repo_url, "git@bitbucket.org:onemahon/azandria-blaugh.git"

set :deploy_to, "/var/www/#{fetch(:application)}"
set :deploy_user, "rincewind"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, "2.1.3"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

set :passenger_restart_with_touch, true