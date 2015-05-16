module ClassyPlivo
  class Response
    attr_reader :http_status, :payload

    # Raised when attempting to access a key that does not exist in Plivo's
    # response payload
    NoPayloadKeyError = Class.new(NoMethodError)

    def initialize(response)
      @http_status = response[0]
      @payload = response[1]
    end

    # True if 4XX or 5XX status code is received
    def error?
      http_status >= 400 && http_status <= 599
    end

    def has_payload_key?(key)
      payload.has_key?(key)
    end

    # Delegate all other method calls to the payload hash
    def method_missing(method, *args, &block)
      payload_key = method.to_s
      if has_payload_key?(payload_key)
        payload[payload_key]
      else
        fail NoPayloadKeyError,
          "Key '#{payload_key}' not found in response payload: #{payload}"
      end
    end
  end
end
