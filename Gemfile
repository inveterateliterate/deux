source 'https://rubygems.org'
ruby '2.3.3'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '5.1.4'
gem 'rack-cors'
gem 'token_master'
gem 'bcrypt'
gem 'bullet'
gem 'active_model_serializers'
gem 'decanter'
gem 'pg', '~> 0.18'
gem 'rails_util', github: 'launchpadlab/rails_util'
gem 'sentry-raven'
gem 'figaro'
gem 'puma', '~> 3.7'
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers', '~> 3.1'
end
