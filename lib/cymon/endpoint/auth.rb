require 'cymon/responses/auth'

module Cymon
  module Endpoint
    class Auth < Base
      PATH = '/auth'

      def url_path
        "#{api_version_path}/#{PATH}"
      end

      # Authenticate with username and password to get a JSON Web Token.
      # http://docs.cymon.io/#auth-login-post
      def login(creds = {})
        creds ||= @config.creds
        response = @api.post("#{url_path}/login") do |req|
          req.body = creds
        end

        parsed_resp = Cymon::Responses::Base.new(response)

        if response.status == 200
          @config.token = parsed_resp.body['jwt']
        end

        parsed_resp
      end

      # If the token not exists and username & password exists it makes login
      # else return the token
      def check_token
        if @client.config.token.nil? && (@client.config.username && @client.config.password)
          login
        else
          @client.config.token.nil?
        end
      end

      private

      def default_params(params)
        params.select { |key, _value| [:username, :password].include?(key) }
      end
    end
  end
end
