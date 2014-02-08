source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.beta1'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
platform :ruby do
  gem 'therubyracer'
end

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',          group: :doc, require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/jonleighton/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use thin as the app server
gem 'thin'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'pry-rails'
end

group :test do
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'capybara'
end

group :development do
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-migrate'
  gem 'guard-rspec', require: false
  gem 'guard-cucumber'
  gem 'guard-livereload', require: false
  gem 'letter_opener'
  gem 'factory_girl_rails', require: false
end

gem 'devise'
gem 'devise-i18n-views'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'ransack'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
