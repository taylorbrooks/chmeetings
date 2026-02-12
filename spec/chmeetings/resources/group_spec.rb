require 'spec_helper'

RSpec.describe Chmeetings::Client::Group, type: :model do
  include_context 'resource specs'

  describe '#list_groups' do
    it 'returns a hash' do
      expect(client.list_groups).to be_a(Hash)
    end

    it 'queries groups' do
      expect(client).to receive(:get).with('groups', {}).and_call_original

      resource = client.list_groups

      expect(resource['data'].first['group_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('groups', { page: 1 }).and_call_original

      client.list_groups(page: 1)
    end
  end
end
