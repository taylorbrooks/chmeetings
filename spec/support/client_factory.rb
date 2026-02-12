RSpec.shared_context 'resource specs' do
  let(:attrs) do
    {
      api_key: 'test_api_key',
      base_url: 'http://api.chmeetings.com/api/v1/'
    }
  end

  let(:client) { Chmeetings::Client.new(**attrs) }
end
