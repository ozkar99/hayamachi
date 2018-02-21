require_relative 'hayamachi_response'

class Hayamichi
  attr_accessor :endpoint, :method

  ALLOWED_METHODS = [:get, :post]

  def initialize(endpoint, hash)
    @endpoint = endpoint
    @method = hash[:method] || :post

    raise "Unsupported method, only :post or :get allowed" unless ALLOWED_METHODS.include? @method
  end

  def submit
    puts "I am submitting~" 
  end
end