require 'faraday'

module Chmeetings # :nodoc: all
  class Error < StandardError; end
  class BadGateway < Error; end
  class BadRequest < Error; end
  class CloudflareError < Error; end
  class Forbidden < Error; end
  class GatewayTimeout < Error; end
  class InternalServerError < Error; end
  class NotFound < Error; end
  class ServiceUnavailable < Error; end
  class TooManyRequests < Error; end
  class Unauthorized < Error; end

  module FaradayMiddleware
    class ChmeetingsErrorHandler < Faraday::Middleware
      ERROR_STATUSES = (400..600).freeze

      ##
      # Throws an exception for responses with an HTTP error code.
      def on_complete(env)
        message = error_message(env)

        case env[:status]
        when 400
          raise Chmeetings::BadRequest, message
        when 401
          raise Chmeetings::Unauthorized, message
        when 403
          raise Chmeetings::Forbidden, message
        when 404
          raise Chmeetings::NotFound, message
        when 429
          raise Chmeetings::TooManyRequests, message
        when 500
          raise Chmeetings::InternalServerError, message
        when 502
          raise Chmeetings::BadGateway, message
        when 503
          raise Chmeetings::ServiceUnavailable, message
        when 504
          raise Chmeetings::GatewayTimeout, message
        when 520
          raise Chmeetings::CloudflareError, message
        when ERROR_STATUSES
          raise Chmeetings::Error, message
        end
      end

      private

      def error_message(env)
        "#{env[:status]}: #{env[:url]} #{env[:body]}"
      end
    end
  end
end
