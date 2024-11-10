# frozen_string_literal: true

require 'sbmt/pact/rspec'
require 'zoo_app/animal_service_client'

module ZooApp
  RSpec.describe 'Sbmt::Pact::Providers::Test::HttpClient', :pact do
    has_http_pact_between 'Zoo App', 'Animal Service'

    describe '.find_alligator_by_name' do
      let(:interaction) { new_interaction }

      context "when an alligator by the given name exists" do
        let(:interaction) do
          super()
            .given('there is an alligator named Mary')
            .upon_receiving('a request for an alligator')
              .with_request(:get, '/alligators/Mary', headers: { 'Accept' => 'application/json' })
            .with_response(200, body: { name: match_type_of('Johnny') })
        end

        it 'returns the alligator' do
          interaction.execute do |mock_server|
            mock_server_url = "#{mock_server.instance_variable_get(:@transport)}://#{mock_server.instance_variable_get(:@host)}:#{mock_server.instance_variable_get(:@port)}"
            AnimalServiceClient.base_uri mock_server_url

            expect(AnimalServiceClient.find_alligator_by_name('Mary')).to eq ZooApp::Animals::Alligator.new(name: 'Johnny')
          end
        end
      end
      context "when an alligator by the given name does not exist" do
        let(:interaction) do
          super()
            .given("there is not an alligator named Mary")
            .upon_receiving('a request for an alligator')
              .with_request(:get, '/alligators/Mary', headers: { 'Accept' => 'application/json' })
            .with_response(404)
        end

        it "returns nil" do
          interaction.execute do |mock_server|
            mock_server_url = "#{mock_server.instance_variable_get(:@transport)}://#{mock_server.instance_variable_get(:@host)}:#{mock_server.instance_variable_get(:@port)}"
            AnimalServiceClient.base_uri mock_server_url

            expect(AnimalServiceClient.find_alligator_by_name("Mary")).to be_nil
          end
        end
      end
      context "when an error occurs retrieving the alligator" do
        let(:interaction) do
          super()
            .given("an error occurs retrieving an alligator")
            .upon_receiving('a request for an alligator')
              .with_request(:get, '/alligators/Mary', headers: { 'Accept' => 'application/json' })
            .with_response(500, body: {error: 'Argh!!!'})
        end

        it "raises an error" do
          interaction.execute do |mock_server|
            mock_server_url = "#{mock_server.instance_variable_get(:@transport)}://#{mock_server.instance_variable_get(:@host)}:#{mock_server.instance_variable_get(:@port)}"
            AnimalServiceClient.base_uri mock_server_url

            expect{ AnimalServiceClient.find_alligator_by_name("Mary") }.to raise_error /Argh/
          end
        end
      end
    end
  end
end
