require_relative 'hayamichi_constants'
require_relative 'hayamichi_response'

require 'uri'

class Hayamichi
  attr_accessor :uri, :method
  attr_reader :data

  def initialize(uri, hash = { method: :post })
    @uri = uri
    raise INVALID_URI_ERROR unless @uri =~ URI::regexp
    
    @method = hash[:method]
    raise INVALID_METHOD_ERROR unless ALLOWED_METHODS.include? @method
  end

  def submit
    raise DATA_NIL_ERROR if @data.nil?

    if @method == POST
      post
    else
      get
    end
  end

  def data=(data)
    @data = URI.encode_www_form data
  end

  private
  def post;end

  def get;end
end