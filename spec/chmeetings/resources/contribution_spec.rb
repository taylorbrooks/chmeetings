require 'spec_helper'

RSpec.describe Chmeetings::Client::Contribution, type: :model do
  include_context 'resource specs'

  describe '#list_contributions' do
    it 'returns a hash' do
      expect(client.list_contributions).to be_a(Hash)
    end

    it 'queries contributions' do
      expect(client).to receive(:get).with('contributions', {}).and_call_original

      resource = client.list_contributions

      expect(resource['data'].first['contribution_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('contributions', { page: 1 }).and_call_original

      client.list_contributions(page: 1)
    end
  end

  describe '#create_contribution' do
    it 'returns a hash' do
      expect(client.create_contribution(person_id: 1, amount: 100.0)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('contributions', { person_id: 1, amount: 100.0 })
        .and_call_original

      client.create_contribution(person_id: 1, amount: 100.0)
    end
  end
end
