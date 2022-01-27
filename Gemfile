# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", "0.22.0"
gem "decidim-consultations", "0.22.0"
# gem "decidim-initiatives"

gem "airbrake", "~> 5.0"
gem "daemons"
gem "faker", "~> 1.8.4"
gem "figaro"
gem "graphiql-rails", "~> 1.4", "< 1.5"
gem "puma", "~> 4.3"
gem "redis-namespace"
gem "sidekiq", "~> 6.4"
gem "uglifier", ">= 1.3.0"
gem "virtus-multiparams"
gem "wicked_pdf"

gem "ransack", "2.1.1"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri
  gem "decidim-dev", "0.22.0"
  gem "rubocop"
end

group :development do
  gem "letter_opener_web", "~> 1.3.0"
  gem "listen", "~> 3.1.0"
  gem "rspec-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"

  # deploy
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-bundler", "~> 1.3", require: false
  gem "capistrano3-puma", "~> 4.0"
  gem "capistrano-rails", "~> 1.3", require: false
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano-sidekiq", "1.0.2"
end
