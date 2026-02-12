require 'faraday'

Dir[File.expand_path('client/*.rb', __dir__)].sort.each { |f| require f }

module Chmeetings
  class Client
    include Batch
    include Person
    include Family
    include FamilyMember
    include Group
    include Contribution
    include Pledge
    include Campaign

    def initialize(**config)
      @api_key = config[:api_key] || ENV.fetch('CHMEETINGS_API_KEY', nil)
      @base_url = config[:base_url] || 'https://api.chmeetings.com/api/v1/'
      @logger = config[:logger]
      @adapter = config[:adapter] || Faraday.default_adapter
    end

    [:get, :post, :delete, :patch, :put].each do |http_method|
      define_method(http_method) do |path, body = {}|
        connection.public_send(http_method, path, body).body
      end
    end

    private

    def connection
      Faraday.new(url: @base_url) do |conn|
        conn.headers['ApiKey'] = @api_key
        conn.request :json
        conn.response :chmeetings_oj
        conn.response :logger, @logger if @logger
        conn.use Chmeetings::FaradayMiddleware::ChmeetingsErrorHandler
        conn.adapter @adapter
      end
    end
  end
end
