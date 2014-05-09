source 'https://rubygems.org'
#ruby '1.9.3'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'rails', '4.0.2'
gem 'bootstrap-sass', '2.3.1.0'
gem 'sprockets', '2.11.0'
gem 'bcrypt-ruby', '3.1.2'
gem 'nokogiri'
gem 'rails-observers'
gem 'letter_opener'


# Use sqlite3 as the database for Active Record
group :development, :test do
	gem 'sqlite3', '1.3.8'
	gem 'launchy'
  #gem 'database-cleaner', '1.2.0'
  gem 'capybara'
  ## gem to create Active Record objects for testing
  gem 'factory_girl_rails', '4.2.1'

  gem 'cucumber-rails', :require=>false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'rspec-rails', '2.13.1'
  #gem 'capybara', '~> 2.1.0'
  gem 'shoulda-matchers', '~> 2.2.0'
  gem 'shoulda-context', '~> 1.1.5'


end

group :assets do
# Use SCSS for stylesheets
gem 'sass-rails', '4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.1.1'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.1'

end
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '1.0.2'



group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '0.3.20', require: false
end

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

gem 'ransack'

gem 'devise'

gem "paperclip", "~> 4.1"
gem 'cocoon'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
