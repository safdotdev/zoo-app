source 'https://rubygems.org'

group :development, :test do
  gem 'rspec'
  gem 'pact'
  if ENV['X_PACT_DEVELOPMENT']
    gem 'sbmt-pact', path: '../../sbmt-pact'
  else
    gem 'sbmt-pact', git: 'https://github.com/YOU54F/sbmt-pact.git', branch: 'feat/pact-ruby'
  end
  gem 'combustion'
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]  
  gem 'pact_broker-client'
  gem 'pry'
end

gem 'rake'
gem 'rack'
gem 'httparty'
