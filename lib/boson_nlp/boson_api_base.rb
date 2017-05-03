require 'httparty'

module BosonNlp
  # ApiBase
  class BosonApiBase
    include HTTParty
    attr_accessor :token, :body, :query_hash, :response
    attr_writer :http_method
    base_uri 'api.bosonnlp.com'

    def initialize
      configure = BosonNlp.configuration
      api_token = configure.api_token
      raise 'Boson nlp api token not configured' if api_token.nil?
      @token = api_token
    end

    def http_method
      @http_method || :get
    end

    def request_header
      {}
    end

    def api_path
      raise 'unimplemented method'
    end

    def request
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-Token' => token
      }.merge! request_header
      request_method = BosonApiBase.method(http_method)
      @response = request_method.call api_path, headers: headers, query: query_hash, body: body
    end

  end
end
