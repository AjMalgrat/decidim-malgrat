# frozen_string_literal: true

server "beta.decidim.ajmalgrat.cat", roles: %w(app db web worker)
set :branch, "master"
