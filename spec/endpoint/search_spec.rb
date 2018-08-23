require 'spec_helper'

RSpec.describe Cymon::Endpoint::Search do
  let(:params) { { size: 5 } }
  let(:client) { Cymon::Client.new }

  subject(:search) { client.search }

  context '#by_ip' do
    let(:ip) { '209.90.88.140' }
    let(:response) do
      VCR.use_cassette('search_by_ip') do
        search.by_ip(ip, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_domain' do
    let(:domain) { '5gbfree.com' }
    let(:response) do
      VCR.use_cassette('search_by_domain') do
        search.by_domain(domain, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_hostname' do
    let(:hostname) { 'kamadenlai.5gbfree.com' }
    let(:response) do
      VCR.use_cassette('search_by_hostname') do
        search.by_hostname(hostname, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_md5' do
    let(:md5) { '86845ea1079ea26ecac6115ba6f4a66e' }
    let(:response) do
      VCR.use_cassette('search_by_md5') do
        search.by_md5(md5, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_sha1' do
    let(:sha1) { '736a602300a0476b738a53ee7feb5f9bfabca1b0' }
    let(:response) do
      VCR.use_cassette('search_by_sha1') do
        search.by_sha1(sha1, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_sha256' do
    let(:sha256) { '91bcefdea13e64ac5b55f1f92e58f8ff236611de3255b483cc54ee4a572017cb' }
    let(:response) do
      VCR.use_cassette('search_by_sha256') do
        search.by_sha256(sha256, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end

  context '#by_term' do
    let(:term) { 'locky' }
    let(:response) do
      VCR.use_cassette('search_by_term') do
        search.by_term(term, params)
      end
    end

    it 'status 200' do
      expect(response.status).to be 200
    end

    it 'hits exist' do
      expect(response.body).to have_key('hits')
    end

    it 'correct size' do
      expect(response.body['size']).to be params[:size]
    end
  end
end