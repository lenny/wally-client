require 'wally/config'
require 'wally/rest_resource'
require 'wally/client_error'

module Wally
  module Commands
    class Base
      def resource(options = {})
        options[:headers] = { :client_version => Wally::Client::Version::STRING }
        Wally::RestResource.new(url, options)
      end
      
      def url
        Wally::Config.url
      end
    end
  end
end