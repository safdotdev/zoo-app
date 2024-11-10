require 'rspec/core/rake_task'
require 'pact_broker/client/tasks'

$LOAD_PATH << './lib'

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new('pact:spec') do |task|
  task.pattern = 'spec/pact/providers/**/*_spec.rb'
  task.rspec_opts = ['-t pact']
end

RSpec::Core::RakeTask.new('pact:v1:spec') do |task|
  task.pattern = 'spec/service_providers/*_spec.rb'
  task.rspec_opts = ['-t pact']
end

PactBroker::Client::PublicationTask.new do | task |
  require 'zoo_app/version'
  task.consumer_version = ENV['GIT_COMMIT'] || `git rev-parse --verify HEAD`.strip
  task.tags = [ENV['GIT_BRANCH'] || `git rev-parse --abbrev-ref HEAD`.strip]
  task.branch = ENV['GIT_BRANCH'] || `git rev-parse --abbrev-ref HEAD`.strip
  task.pact_broker_base_url = "https://test.pactflow.io"
  task.pact_broker_basic_auth =  { username: "dXfltyFMgNOFZAxr8io9wJ37iUpY42M", password: "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"}
end

PactBroker::Client::PublicationTask.new(:local) do | task |
  require 'zoo_app/version'
  task.consumer_version = `git rev-parse --verify HEAD`.strip
  task.tags = [ `git rev-parse --abbrev-ref HEAD`.strip ]
  task.pact_broker_base_url = "http://localhost:9292"
end

task :default => :spec
