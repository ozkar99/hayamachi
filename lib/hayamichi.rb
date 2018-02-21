require_relative 'hayamichi_constants'
require_relative 'hayamichi_response'

require 'uri'
require 'net/http'

class Hayamichi
  attr_accessor :uri, :method, :data
  attr_reader :data

  def initialize(uri, hash = { method: :post })
    raise INVALID_URI_ERROR unless uri =~ URI::regexp
    @uri = URI(uri)
    
    @method = hash[:method]
    raise INVALID_METHOD_ERROR unless ALLOWED_METHODS.include? @method
  end

  def submit
    raise DATA_NIL_ERROR if @data.nil?

    if @method == POST
      response = Net::HTTP.post_form @uri, @data
    else
      uri = uri_for_get @uri, @data 
      response = Net::HTTP.get uri
    end

    Response.new(response)
  end

  private
  def uri_for_get uri, data
    parsed = URI(uri)
  end
end