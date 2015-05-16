module ClassyPlivo
  class RestAPI
    attr_reader :plivo_api

    def initialize(*args)
      @plivo_api = Plivo::RestAPI.new(*args)
    end

    def method_missing(method, *args, &block)
      Response.new(plivo_api.send(method, args, &block))
    end
  end
end
