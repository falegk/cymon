require 'faraday'
require 'faraday_middleware'

require 'cymon/configuration'
require 'cymon/endpoint/base'
require 'cymon/endpoint/auth'
require 'cymon/endpoint/search'
require 'cymon/endpoint/feed'

module Cymon
  class Client

    ENDPOINTS = [:auth, :search, :feed].freeze

    attr_reader :configuration

    attr_accessor *ENDPOINTS

    def initialize(options = nil)
      @configuration = Configuration.new(options)
      define_endpoint_methods
    end

    def api_connection(url = nil)
      url ||= "https://api.cymon.io"

      Faraday.new(url: url) do |faraday|
        faraday.response :logger
        faraday.request :json
        faraday.ssl.verify = false
        faraday.headers['Content-Type'] = 'application/json'
        faraday.options.timeout = @configuration.timeout # open/read timeout in seconds
        faraday.adapter Faraday.default_adapter

        if @configuration.token
          faraday.authorization :Bearer, @configuration.token
          faraday.headers['Authorization']
        end
      end
    end

    private

    def define_endpoint_methods
      namespace = "Cymon::Endpoint"

      ENDPOINTS.each do |endpoint|
        endpoint_klass = Object.const_get("#{namespace}::#{endpoint.to_s.capitalize}")
        klass = endpoint_klass.new(self)
        send("#{endpoint.to_s}=", klass)
      end
    end
  end
end
