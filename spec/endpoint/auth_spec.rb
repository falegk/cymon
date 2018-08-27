require 'spec_helper'

RSpec.describe Cymon::Endpoint::Auth do
  let(:creds) { { username: 'cymon_ruby', password: 'cymon_ruby_pass' } }
  let(:invalid_creds) { { username: 'invalid', password: 'creds' } }
  let(:client) { Cymon::Client.new }

  context '#login' do
    let(:response) do
      VCR.use_cassette('login', record: :new_episodes) do
        client.auth.login(creds)
      end
    end

    let(:invalid_response) do
      VCR.use_cassette('login_invalid', record: :new_episodes) do
        client.auth.login(invalid_creds)
      end
    end

    it { expect(response.status).to be 200 }
    it { expect(response.body).to have_key('jwt') }
    it { expect(response.body['jwt']).to be == client.configuration.token }

    it { expect(invalid_response.status).to be 401 }
    it { expect(invalid_response.body).to have_key('errorMessage') }
    it { expect(invalid_response.body['errorMessage']).to match 'authentication error' }
  end
end