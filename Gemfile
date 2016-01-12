source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.1.11'

gem 'mysql2', '~> 0.3.18'

gem 'sass-rails', '~> 4.0.2'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass', '~> 3.2.0.1'

gem 'paperclip', github: 'thoughtbot/paperclip'

gem 'pry-byebug'

gem 'simple_form', '~> 3.0.2'

gem 'devise','~> 3.2.4'

gem 'jquery-ui-rails', '~> 4.2.1'

# Reek is a tool that examines Ruby classes, modules and methods and reports any code smells it finds
gem 'reek', '~> 1.3.8'

gem 'haml'

gem 'searchkick', '~> 0.8.7'

gem 'stripe', '~> 1.25.0'

gem 'omniauth-facebook'
gem 'omniauth-twitter'


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


group  :development, :test do
  # gem 'rack-mini-profiler'
  gem 'railroady'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'brakeman', require: false
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
  gem "puma"
end
