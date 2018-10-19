# frozen_string_literal: true

server "prod-decidim-malgrat", roles: %w(app db web worker)
set :branch, "master"
set :rails_env, "production"
