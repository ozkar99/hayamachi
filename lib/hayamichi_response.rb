require 'net/http'
require 'uri'

class Hayamichi
  class Response
    attr_reader :status, :url, :data, :response

    def initialize(response)
      @success, @url, @data = false, '', {}
      @response = response # raw response

      raise INVALID_RESPONSE_ERROR unless @response.respond_to? :status

      case response
        when Net::HTTPRedirection then
          redirect = response['location']
          if redirect != ''
            @success = true
            
            uri = URI redirect
            @url = url_from_uri uri
            @data = URI.decode_www_form(uri.query).to_h
          end
        else
          @success = false
        end
      end

      private
      def url_from_uri uri
        "#{uri.scheme}://#{uri.host}#{uri.path}"
      end
  end
end