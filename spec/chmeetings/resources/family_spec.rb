require 'spec_helper'

RSpec.describe Chmeetings::Client::Family, type: :model do
  include_context 'resource specs'

  describe '#list_families' do
    it 'returns a hash' do
      expect(client.list_families).to be_a(Hash)
    end

    it 'queries families' do
      expect(client).to receive(:get).with('families', {}).and_call_original

      resource = client.list_families

      expect(resource['data'].first['family_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('families', { page: 1 }).and_call_original

      client.list_families(page: 1)
    end
  end

  describe '#create_family' do
    it 'returns a hash' do
      expect(client.create_family(name: 'Doe Family')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('families', { name: 'Doe Family' })
        .and_call_original

      client.create_family(name: 'Doe Family')
    end
  end

  describe '#get_family' do
    it 'returns a hash' do
      expect(client.get_family(family_id: 1)).to be_a(Hash)
    end

    it 'passes options' do
      expect(client).to receive(:get)
        .with('families/show', { family_id: 1 })
        .and_call_original

      client.get_family(family_id: 1)
    end
  end

  describe '#update_family' do
    it 'returns a hash' do
      expect(client.update_family(family_id: 1, name: 'Smith Family')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:put)
        .with('families', { family_id: 1, name: 'Smith Family' })
        .and_call_original

      client.update_family(family_id: 1, name: 'Smith Family')
    end
  end

  describe '#delete_family' do
    it 'returns a hash' do
      expect(client.delete_family(family_id: 1)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('families/delete', { family_id: 1 })
        .and_call_original

      client.delete_family(family_id: 1)
    end
  end
end
