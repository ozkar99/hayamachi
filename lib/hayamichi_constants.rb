class Hayamichi
    GET, POST = :get, :post

    INVALID_URI_ERROR = "Invalid uri"
    INVALID_METHOD_ERROR = "Invalid method, only :post and :get are allowed"
    DATA_NIL_ERROR = "Data is not set, cant submit with no data"

    INVALID_RESPONSE_ERROR = "This doesnt look like an http response"
    
    ALLOWED_METHODS = [GET, POST]
end