require 'spec_helper'

RSpec.describe Chmeetings::Client::FamilyMember, type: :model do
  include_context 'resource specs'

  describe '#list_family_members' do
    it 'returns a hash' do
      expect(client.list_family_members(family_id: 1)).to be_a(Hash)
    end

    it 'queries family members' do
      expect(client).to receive(:get).with('family-members', { family_id: 1 }).and_call_original

      resource = client.list_family_members(family_id: 1)

      expect(resource['data'].first['id']).to eq(1)
    end
  end

  describe '#create_family_member' do
    it 'returns a hash' do
      expect(client.create_family_member(family_id: 1, person_id: 1)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('family-members', { family_id: 1, person_id: 1 })
        .and_call_original

      client.create_family_member(family_id: 1, person_id: 1)
    end
  end

  describe '#update_family_member' do
    it 'returns a hash' do
      expect(client.update_family_member(id: 1, family_id: 1, person_id: 2)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:put)
        .with('family-members', { id: 1, family_id: 1, person_id: 2 })
        .and_call_original

      client.update_family_member(id: 1, family_id: 1, person_id: 2)
    end
  end

  describe '#patch_family_member' do
    it 'returns a hash' do
      expect(client.patch_family_member(id: 1, role: 'Head')).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:patch)
        .with('family-members', { id: 1, role: 'Head' })
        .and_call_original

      client.patch_family_member(id: 1, role: 'Head')
    end
  end

  describe '#delete_family_member' do
    it 'returns a hash' do
      expect(client.delete_family_member(id: 1)).to be_a(Hash)
    end

    it 'passes data' do
      expect(client).to receive(:post)
        .with('family-members/delete', { id: 1 })
        .and_call_original

      client.delete_family_member(id: 1)
    end
  end
end
