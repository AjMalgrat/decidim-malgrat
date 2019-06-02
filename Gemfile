# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gem "decidim", git: "https://github.com/decidim/decidim", branch: "0.17-stable"
gem "decidim-consultations"
gem "decidim-initiatives"

gem "airbrake", "~> 5.0"
gem "daemons"
gem "delayed_job_active_record"
gem "faker", "~> 1.8.4"
gem "figaro"
gem "graphiql-rails", "~> 1.4", "< 1.5"
gem "puma", "~> 3.0"
gem "uglifier", ">= 1.3.0"
gem "virtus-multiparams"
gem "wicked_pdf"

group :development, :test do
  gem "byebug", platform: :mri
  gem "decidim-dev"
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
  gem "capistrano-rails", "~> 1.3", require: false
  gem "capistrano-rbenv", "~> 2.1"
  gem "capistrano3-delayed-job", "~> 1.0"
  gem "capistrano3-puma", "~> 3.1"
end
