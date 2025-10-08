require 'rspec/core/rake_task'
require 'pact_broker/client/tasks'

$LOAD_PATH << './lib'

RSpec::Core::RakeTask.new(:spec)

PactBroker::Client::PublicationTask.new do | task |
  require 'zoo_app/version'
  task.consumer_version = ENV['GIT_COMMIT'] || `git rev-parse --verify HEAD`.strip
  task.tags = [ENV['GIT_BRANCH'] || `git rev-parse --abbrev-ref HEAD`.strip]
  task.branch = ENV['GIT_BRANCH'] || `git rev-parse --abbrev-ref HEAD`.strip
  task.pact_broker_base_url = "https://testdemo.pactflow.io"
  task.pact_broker_basic_auth =  { token: "129cCdfCWhMzcC9pFwb4bw" }
end

PactBroker::Client::PublicationTask.new(:local) do | task |
  require 'zoo_app/version'
  task.consumer_version = `git rev-parse --verify HEAD`.strip
  task.tags = [ `git rev-parse --abbrev-ref HEAD`.strip ]
  task.pact_broker_base_url = "http://localhost:9292"
end

task :default => :spec
