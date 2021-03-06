# frozen_string_literal: true

lock "~> 3.14.1"

set :application, "decidim-malgrat"
set :repo_url, "https://github.com/AjMalgrat/decidim-malgrat.git"

set :deploy_to, "/home/ruby-data/app"

set :rbenv_type, :user
set :delayed_job_workers, 1
set :rbenv_ruby, '2.6.3'

set :sidekiq_config, "config/sidekiq.yml"
set :init_system, :systemd

append :linked_files, "config/application.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

set :puma_bind, "tcp://0.0.0.0:3000"
set :puma_user, fetch(:user)
append :rbenv_map_bins, 'puma', 'pumactl'
