require 'cymon/version'
require 'cymon/client'

module Cymon
  def self.client(options = {})
    @client ||= Cymon::Client.new(options)
  end
end
