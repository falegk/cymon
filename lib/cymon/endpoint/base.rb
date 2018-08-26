require 'json'

require 'cymon/responses/base'

module Cymon
  module Endpoint
    class Base
      attr_accessor :client, :config
      attr_accessor :api, :api_version_path

      def initialize(client)
        @client = client
        @config = @client.configuration
        @api = @client.api_connection

        @api_version_path = @client.configuration.api_version
      end
    end
  end
end