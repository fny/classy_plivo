module ClassyPlivo
  class RestAPI
    attr_reader :plivo_api

    def initialize(*args)
      @plivo_api = Plivo::RestAPI.new(*args)
    end

    def method_missing(method, *args, &block)
      result = plivo_api.send(method, *args, &block)
      if resembles_plivo_response?(result)
        Response.new(result)
      else
        result
      end
    end

    private

    def resembles_plivo_response?(result)
      if result.is_a?(Array)
        http_status, payload = result
        http_status.is_a?(Integer) && payload.is_a?(Hash)
      else
        false
      end
    end
  end
end
