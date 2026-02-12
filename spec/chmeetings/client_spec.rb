require 'spec_helper'

RSpec.describe Chmeetings::Client do
  let(:attrs) { { api_key: 'test_api_key' } }

  subject(:client) { described_class.new(**attrs) }

  shared_examples 'param request' do |verb|
    let(:endpoint) { "#{verb}_test" }
    let(:url) { "https://api.chmeetings.com/api/v1/#{endpoint}" }

    before do
      stub_request(:any, /_test/).to_return(body: response_body.to_json)
    end

    it 'requests at `path` argument' do
      client.public_send(verb, endpoint)

      expect(WebMock).to have_requested(verb, url)
    end

    it 'passes request parameters' do
      client.public_send(verb, endpoint, request_params)

      expect(WebMock).to have_requested(verb, url).with(query: request_params)
    end

    it 'returns parsed response body' do
      expect(client.public_send(verb, endpoint)).to eq(response_body)
    end
  end

  shared_examples 'body request' do |verb|
    let(:body) { { 'test' => 123 } }
    let(:endpoint) { "#{verb}_test" }
    let(:url) { "https://api.chmeetings.com/api/v1/#{endpoint}" }

    let(:do_request) { client.public_send(verb, endpoint, body) }

    before do
      stub_request(:any, /_test/).to_return(body: body.to_json)
    end

    it 'requests at `path` argument' do
      do_request

      expect(WebMock).to have_requested(verb, url)
    end

    it 'passes request body' do
      do_request

      expect(WebMock)
        .to have_requested(verb, url)
        .with(body: body)
    end

    it 'returns parsed response body' do
      expect(do_request).to eq(body)
    end
  end

  describe 'authentication' do
    let(:path) { 'people' }
    let(:url) { "https://api.chmeetings.com/api/v1/#{path}" }

    it 'sends the ApiKey header' do
      client.get(path)

      expect(WebMock).to have_requested(:get, url)
        .with(headers: { 'ApiKey' => 'test_api_key' })
    end
  end

  describe 'env var authentication' do
    let(:attrs) { {} }

    before do
      allow(ENV).to receive(:fetch).with('CHMEETINGS_API_KEY', nil).and_return('env_api_key')
    end

    it 'uses CHMEETINGS_API_KEY env var' do
      client.get('people')

      expect(WebMock).to have_requested(:get, 'https://api.chmeetings.com/api/v1/people')
        .with(headers: { 'ApiKey' => 'env_api_key' })
    end
  end

  describe '#get(path, options = {})' do
    let(:request_params) { { 'test' => 123 } }
    let(:response_body) { request_params }

    include_examples 'param request', :get
  end

  describe '#delete(path, options = {})' do
    let(:request_params) { { 'test' => 123 } }
    let(:response_body) { {} }

    include_examples 'param request', :delete
  end

  describe '#patch(path, options = {})' do
    include_examples 'body request', :patch
  end

  describe '#post(path, options = {})' do
    include_examples 'body request', :post
  end

  describe '#put(path, options = {})' do
    include_examples 'body request', :put
  end
end
