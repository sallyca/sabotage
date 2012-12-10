source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


gem 'nokogiri'
gem 'activeadmin', :git => "git://github.com/gregbell/active_admin.git"
gem 'dragonfly'
gem 'rack-cache', :require => 'rack/cache'
gem 'rack-rewrite'
gem 'acts_as_indexed'
gem 'randumb'
gem 'sorcery'
gem 'simple_form'
gem 'has_unique_slug'

# Gems used only for assets and not required
# in production environments by default.

gem 'coffee-rails', "~> 3.1.0"
gem 'uglifier'


gem 'sass-rails'

gem 'jquery-rails'
gem 'haml'
group :production do
  gem 'thin'
  gem 'pg'
end


group :test, :development do
  # Pretty printed test output
  gem 'sqlite3'
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem "factory_girl_rails", "~> 1.6.0"
  gem 'shoulda'
  gem 'minitest'
  gem 'capybara'
  gem 'launchy'
end
