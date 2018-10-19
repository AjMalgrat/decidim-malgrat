# frozen_string_literal: true

lock "~> 3.11.0"

set :application, "decidim-malgrat"
set :repo_url, "https://github.com/AjMalgrat/decidim-malgrat.git"


set :rbenv_type, :user
set :delayed_job_workers, 1

append :linked_files, "config/application.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

set :puma_bind, "tcp://0.0.0.0:3000"
set :puma_user, fetch(:user)

