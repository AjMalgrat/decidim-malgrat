# frozen_string_literal: true

server "stag-decidim-malgrat", roles: %w(app db web worker)
set :branch, "master"
set :rails_env, "staging"
