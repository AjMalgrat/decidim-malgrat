# frozen_string_literal: true

source 'https://rubygems.org'

ruby RUBY_VERSION || '2.4.1'

DECIDIM_VERSION = '0.13.1'

gem 'decidim', DECIDIM_VERSION

gem 'airbrake', '~> 5.0'
gem 'daemons'
gem 'delayed_job_active_record'
gem 'faker', '~> 1.8.4'
gem 'puma'
gem 'uglifier', '>= 1.3.0'
gem 'virtus-multiparams'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'decidim-dev', DECIDIM_VERSION
end

group :development do
  gem 'letter_opener_web', '~> 1.3.0'
  gem 'listen', '~> 3.1.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'

  # deploy
  gem 'capistrano', '3.8.0', require: false
  gem 'capistrano-bundler', '~> 1.2', require: false
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '1.1.8', require: false
  gem 'capistrano-rbenv'
  gem 'capistrano3-delayed-job', '~> 1.0'
end
