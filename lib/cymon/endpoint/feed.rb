require 'cymon/responses/feed'

module Cymon
  module Endpoint
    class Feed < Base
      PATH = '/feeds'

      def url_path
        "#{api_version_path}/#{PATH}"
      end

      def all(params = {})
        params = default_params(params)
        response = @api.get(url_path, params)
        Cymon::Responses::Feed.new(response)
      end

      def find(feed_id, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/#{feed_id}", params)
        Cymon::Responses::Feed.new(response)
      end

      private

      def default_params(params)
        params.select { |key, _value| [:size, :from, :privacy].include?(key) }
      end
    end
  end
end
