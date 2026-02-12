require 'spec_helper'

RSpec.describe Chmeetings::Client::Pledge, type: :model do
  include_context 'resource specs'

  describe '#list_pledges' do
    it 'returns a hash' do
      expect(client.list_pledges).to be_a(Hash)
    end

    it 'queries pledges' do
      expect(client).to receive(:get).with('pledges', {}).and_call_original

      resource = client.list_pledges

      expect(resource['data'].first['pledge_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('pledges', { page: 1 }).and_call_original

      client.list_pledges(page: 1)
    end
  end
end
