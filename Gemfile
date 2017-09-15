# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'httparty', '0.14.0'
gem 'rubyzip'
gem 'activesupport'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'rspec-rails', '~> 3.5'
  gem 'dotenv-rails'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end
