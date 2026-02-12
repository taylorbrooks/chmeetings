require 'spec_helper'

RSpec.describe Chmeetings::Client::Campaign, type: :model do
  include_context 'resource specs'

  describe '#list_campaigns' do
    it 'returns a hash' do
      expect(client.list_campaigns).to be_a(Hash)
    end

    it 'queries campaigns' do
      expect(client).to receive(:get).with('campaigns', {}).and_call_original

      resource = client.list_campaigns

      expect(resource['data'].first['campaign_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('campaigns', { page: 1 }).and_call_original

      client.list_campaigns(page: 1)
    end
  end
end
