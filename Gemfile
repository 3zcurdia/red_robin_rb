# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "pg", "~> 1.3"
gem "puma", "~> 5.6"
gem "rails", "~> 7.0.3"

# gem "kredis"
# gem "image_processing", "~> 1.2"
gem "bcrypt", "~> 3.1.18"
gem "bunny"
# gem "redis", "~> 4.0"
gem "slack-notifier"
gem "sneakers"

gem "importmap-rails"
gem "jbuilder"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
end

group :development do
  gem "rack-mini-profiler"
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
