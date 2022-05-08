source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Postgres database
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data.
gem 'rails_admin', git: 'https://github.com/Hey-Feres/rails_admin.git'
# Translations for Rails Admin v0.6.6+ pulled from various sources
gem 'rails_admin-i18n'
# Shim to load environment variables from .env into ENV in development
gem 'dotenv-rails'
# This gem is a port of Perl's Data::Faker library that generates fake data.
gem 'faker'
# Slim generators for Rails
gem 'slim-rails'
# RuboCop is a Ruby linter and code formatter
gem 'rubocop'
# Used for processing rails admin images
gem 'image_processing', '~> 1.2'
# Capistrano is a utility and framework for executing commands in parallel on multiple remote machines, via SSH.
gem 'capistrano', '~> 3.17'
# RVM integration for Capistrano
gem 'capistrano-rvm'
# Bundler support for Capistrano 3.x
gem 'capistrano-bundler', '~> 2.0', '>= 2.0.1'
# Rails specific Capistrano tasks
gem 'capistrano-rails', '~> 1.6', '>= 1.6.2'
# A Ruby binding to the Ed25519 elliptic curve public-key signature system described in RFC 8032.
gem 'ed25519', '~> 1.3'
# This gem implements bcrypt_pbkdf (a variant of PBKDF2 with bcrypt-based PRF)
gem 'bcrypt_pbkdf', '~> 1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Unicorn specific Capistrano tasks
  gem 'capistrano3-unicorn'
end

group :production do
  # Unicorn is an HTTP server for Rack applications designed to only serve fast clients on low-latency
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
