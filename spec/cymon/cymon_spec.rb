require 'spec_helper'

RSpec.describe Cymon do
  it "has a version number" do
    expect(Cymon::VERSION).not_to be nil
  end

  describe 'Init Client' do
    subject { Cymon.client }

    it { is_expected.to be_a Cymon::Client }

    it 'has endpoints as methods' do
      expect(subject.methods).to include(*Cymon::Client::ENDPOINTS)
    end
  end

  describe 'Init Client with options' do
    subject { Cymon::Client.new(timeout: 10) }

    it { is_expected.to be_a Cymon::Client }
    it { expect(subject.configuration.timeout).to be 10 }
  end
end