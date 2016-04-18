source 'https://rubygems.org'

gem 'rails', github: "rails/rails"

# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'active_model_serializers', github: "rails-api/active_model_serializers"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'bcrypt'

group :development, :test do
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'factory_girl_rails'
  gem 'shoulda'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
