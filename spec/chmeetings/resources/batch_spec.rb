require 'spec_helper'

RSpec.describe Chmeetings::Client::Batch, type: :model do
  include_context 'resource specs'

  describe '#list_batches' do
    it 'returns a hash' do
      expect(client.list_batches).to be_a(Hash)
    end

    it 'queries batches' do
      expect(client).to receive(:get).with('contributions/batches', {}).and_call_original

      resource = client.list_batches

      expect(resource['data'].first['id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('contributions/batches', { page: 1 }).and_call_original

      client.list_batches(page: 1)
    end
  end

  describe '#create_batch' do
    it 'returns a hash' do
      expect(client.create_batch(name: 'Test Batch', date: '2026-02-16')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('contributions/batches', { name: 'Test Batch', date: '2026-02-16' })
        .and_call_original

      client.create_batch(name: 'Test Batch', date: '2026-02-16')
    end
  end

  describe '#get_batch' do
    it 'returns a hash' do
      expect(client.get_batch(id: 1)).to be_a(Hash)
    end

    it 'passes id' do
      expect(client).to receive(:get).with('contributions/batches/1').and_call_original

      client.get_batch(id: 1)
    end
  end

  describe '#update_batch' do
    it 'returns a hash' do
      expect(client.update_batch(id: 1, name: 'Updated Batch')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:put)
        .with('contributions/batches/1', { name: 'Updated Batch' })
        .and_call_original

      client.update_batch(id: 1, name: 'Updated Batch')
    end
  end

  describe '#delete_batch' do
    it 'passes id' do
      expect(client).to receive(:delete).with('contributions/batches/1').and_call_original

      client.delete_batch(id: 1)
    end
  end
end
