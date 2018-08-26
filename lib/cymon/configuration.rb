module Cymon
  class Configuration
    attr_accessor :api_version, :timeout
    attr_accessor :username, :password, :token

    def initialize(options = nil)
      options = options ? default_options.merge(options) : default_options

      return unless options.is_a?(Hash)

      options.each do |config_name, config_value|
        send("#{config_name}=", config_value)
      end
    end

    def creds
      { 'username': username, 'password': password }
    end

    private

    def default_options
      {
          api_version: 'v2',
          timeout: 60,
          token: nil
      }
    end
  end
end