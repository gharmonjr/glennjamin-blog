# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


gem 'bootsnap', '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'bulma-rails', '~> 0.9.0'              # bulma css
gem 'devise'                               # User authentication
gem 'kaminari'                             # pagination
gem 'pg'                                   # Pg is the Ruby interface to the PostgreSQL RDBMS
gem 'puma', '~> 4.2'                       # Use Puma as the app server
gem 'rails', '~> 6.0.3.2'                  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sassc'                                # Use SCSS for stylesheets
gem 'strong_migrations'                    # Prevent unsafe migrations
gem 'turbolinks', '~> 5'                   # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'tzinfo-data'                          # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'webpacker', '~> 4.0'                  # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker¬

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'awesome_print'           # makes console output easy to read
  gem 'better_errors'           # creates console in browser for errors
  gem 'binding_of_caller'       # goes with better_errors
  gem 'byebug'
  gem 'faker'
  gem 'hashie'                  # Extend Hashes and make them more useful
  gem 'pry-byebug'              # pry byebug
  gem 'pry-rails'               # for calling binding.pry
  gem 'reek'                    # https://github.com/troessner/reek/blob/master/docs/Code-Smells.md
  gem 'rubocop-performance'     # rubocop gem helper
  gem 'rubocop-rails'           # ruby linter
  gem 'scss_lint', require: false # css linter
end

group :development do
  gem 'annotate'                # updates models and model specs with schema
  gem 'brakeman', require: false
  gem 'bullet'                  # detects n+1 queries
  gem 'bundler-audit', require: false
  gem 'bundler-leak', require: false
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-yarn', require: false
  gem 'listen', '~> 3.2'        # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'rails-erd'               # generates ERD chart for your schema, run `bundle exec rake erd`
  gem 'rb-readline'             # resolves readline errors and allows rails con to run
  gem 'spring'                  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'     # Adds support for Capybara system testing and selenium driver
  gem 'database_cleaner'        # clears out test db
  gem 'factory_bot_rails'       # factory support for rspec
  gem 'launchy'                 # open browser with save_and_open_page
  gem 'rspec-rails', '~> 3.5'   # rspec testing
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'        # library for easier testing syntax
  gem 'traceroute'              # check for unused routes/ unreachable actions
  gem 'webdrivers'              # to help with testing
end
