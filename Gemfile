source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'carrierwave'
gem 'fog'
gem 'carrierwave-aws'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'fog-aws'
gem 'httparty'
gem 'mini_magick'
gem 'pg', '~> 0.18'
gem 'pg_search'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

gem 'foundation-rails', "6.3.0.0"

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'valid_attribute'
end

group :test do
  gem 'coveralls', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
