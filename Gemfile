source 'https://rubygems.org'

ruby '2.3.1'

gem 'bundler', '1.11.2'
gem 'rails', '4.2.5.1'

# Database
gem 'pg'
gem 'enumerize'

# Auth & Admin
gem 'devise'
gem 'bcrypt'
# gem 'administrate'

# Views
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'
# gem 'therubyracer'
# gem 'less-rails-semantic_ui', '~> 2.1'
# gem 'autoprefixer-rails', '~> 5.2.1.2'

# API
gem 'jsonapi-resources'
gem 'kaminari'
gem 'api-pagination'
# gem 'versionist'

# Utilities
gem 'addressable', '2.3.8' # 2.4 breaks Octokit
gem 'octokit'
# gem 'wannabe_bool'

# Server
gem 'puma'
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  gem 'foreman'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard'
  gem 'guard-minitest'
end

group :test do
  gem 'minitest'           # Test framework
  gem 'minitest-focus'     # One test at a time
  gem 'minitest-reporters' # For progress bar, etc.
  gem 'minitest-fail-fast' # End test run on first failure
  gem 'webmock',    require: false # Ensure we don't query external services
  gem 'rb-fsevent', require: RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'codeclimate-test-reporter' # Test coverage
  gem 'rake' # For Travis CI
  # gem 'database_cleaner'
end

group :staging, :production do
  gem 'rails_12factor'
  # gem 'newrelic_rpm'
end