require 'cymon/responses/search'

module Cymon
  module Endpoint
    class Search < Base
      PATH = 'ioc/search'

      def url_path
        "#{api_version_path}/#{PATH}"
      end

      # Search threat reports by IP address (IPv4 and IPv6).
      # http://docs.cymon.io/#search-search-by-ip-get
      #
      # @param value [String] The query value to search for. Example: 209.90.88.140.
      # @param params [Hash]
      #   +startDate+ The start date for searching. Example: 2017-03-25
      #   +endDate+ The end date for searching. Example: 2017-03-29
      #   +from+ The offset to use for pagination. Example: 0
      #   +size+ The limit to use for pagination. Example: 3
      def by_ip(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/ip/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by domain name.
      # http://docs.cymon.io/#search-search-by-domain-get
      def by_domain(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/domain/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by hostname.
      # http://docs.cymon.io/#search-search-by-hostname-get
      def by_hostname(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/hostname/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by md5.
      # http://docs.cymon.io/#search-search-by-md5-get
      def by_md5(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/md5/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by sha1.
      # http://docs.cymon.io/#search-search-by-sha1-get
      def by_sha1(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/sha1/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by sha256.
      # http://docs.cymon.io/#search-search-by-sha256-get
      def by_sha256(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/sha256/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by term.
      # http://docs.cymon.io/#search-search-by-term-get
      def by_term(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/term/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      # Search threat reports by feed.
      # http://docs.cymon.io/#search-search-by-feed-get
      def by_feed(value, params = {})
        params = default_params(params)
        response = @api.get("#{url_path}/feed/#{value}", params)
        Cymon::Responses::Search.new(response)
      end

      private

      def default_params(params)
        params.select { |key, _value| [:from, :size, :startDate, :endDate].include?(key) }
      end
    end
  end
end