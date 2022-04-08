source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'dotenv-rails'
gem 'jquery-rails'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rails_12factor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sass-rails', '>= 6'
gem 'uglifier'
gem 'webpacker', '~> 5'
gem 'where_exists'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug'
  gem 'rubocop', require: false
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end
