module Hayamachi
  class Response
    attr_accessor :status, :url, :data

    def initialize(http_response)
      @status = false
      @url = ""
      @data = {}

      # parse status here if its (301/302) then is success

      # get url from http response

      # get query data from url
    end

  end
end