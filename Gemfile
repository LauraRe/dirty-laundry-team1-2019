source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.3'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'simple_calendar', '~> 2.0'
gem 'open-weather-api'
gem 'acts_as_bookable', git: 'https://github.com/CraftAcademy/acts_as_bookable'
gem 'webpacker', '~> 3.5'
gem 'tailwindcss', '~> 0.2.0'
gem 'devise'
gem 'omniauth-facebook'
gem 'pundit'
gem 'stripe-rails'


group :development, :test do
  gem 'webmock'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'coveralls', require: false
  gem 'launchy'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end