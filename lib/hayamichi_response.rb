require 'net/http'
require 'uri'

class Hayamichi
  class Response
    attr_reader :status, :url, :data, :response

    def initialize(response)
      @status, @url, @data = false, '', {}
      @response = response # raw response

      raise INVALID_RESPONSE_ERROR unless @response.respond_to? :status

      # parse status here then is success
      case response
        when Net::HTTPSuccess then
          @status = true
        when Net::HTTPRedirection then
          @status = true
          redirect = response['location']
          if redirect != ''
            uri = URI redirect
            @url = url_from_uri uri
            @data = URI.decode_www_form(uri.query).to_h
          end
        else
          @status = false
        end
      end

      private
      def url_from_uri uri
        "#{uri.scheme}://#{uri.host}#{uri.path}"
      end
  end
end