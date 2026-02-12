require 'spec_helper'

RSpec.describe Chmeetings::Client::Person, type: :model do
  include_context 'resource specs'

  describe '#list_people' do
    it 'returns a hash' do
      expect(client.list_people).to be_a(Hash)
    end

    it 'queries people' do
      expect(client).to receive(:get).with('people', {}).and_call_original

      resource = client.list_people

      expect(resource['data'].first['person_id']).to eq(1)
    end

    it 'passes options' do
      expect(client).to receive(:get).with('people', { page: 1 }).and_call_original

      client.list_people(page: 1)
    end
  end

  describe '#create_person' do
    it 'returns a hash' do
      expect(client.create_person(first_name: 'John', last_name: 'Doe')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('people', { first_name: 'John', last_name: 'Doe' })
        .and_call_original

      client.create_person(first_name: 'John', last_name: 'Doe')
    end
  end

  describe '#update_person' do
    it 'returns a hash' do
      expect(client.update_person(person_id: 1, first_name: 'Jane')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:put)
        .with('people', { person_id: 1, first_name: 'Jane' })
        .and_call_original

      client.update_person(person_id: 1, first_name: 'Jane')
    end
  end

  describe '#delete_person' do
    it 'returns a hash' do
      expect(client.delete_person(person_id: 1)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('people/delete', { person_id: 1 })
        .and_call_original

      client.delete_person(person_id: 1)
    end
  end
end
