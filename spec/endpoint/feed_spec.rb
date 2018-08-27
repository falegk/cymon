require 'spec_helper'

RSpec.describe Cymon::Endpoint::Feed do
  let(:params) { { from: 5 } }
  let(:client) { Cymon::Client.new }

  subject(:feed) { client.feed }

  context '#all' do
    let(:response) do
      VCR.use_cassette('feed_all', record: :new_episodes) do
        feed.all(params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('feeds')
    end

    it 'correct from param' do
      expect(response.body['from']).to be params[:from]
    end
  end

  context '#find' do
    let(:feed_id) do
      resp = feed.all(params.merge(size: 4))
      resp.body['feeds'].first['id']
    end

    let(:response) do
      VCR.use_cassette('feed') do
        feed.find(feed_id, record: :new_episodes)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'correct id' do
      expect(response.body['id']).to be == feed_id
    end
  end
end