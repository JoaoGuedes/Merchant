source 'http://rubygems.org'

LANG="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# Bundle edge Rails instead:
gem 'rails'

gem 'sqlite3', :group => [:development, :test]

gem 'json'

gem 'devise'
gem 'omniauth'
gem "omniauth-facebook"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Gems to Admin in Rails >= 3.1
gem 'activeadmin'
gem 'sass-rails',   '~> 3.1.4'
gem "meta_search",    '>= 1.1.0.pre'

gem 'jquery-rails'
gem "fancybox-rails"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

group :production do
  # gems specifically for Heroku go here
  gem "pg"
  gem 'therubyracer-heroku', '0.8.1.pre3'
end
