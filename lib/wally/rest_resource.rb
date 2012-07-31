require 'rest_client'

module Wally
  class RestResource
    extend Forwardable
    
    def_delegators :@resource, :[]
    
    def initialize(url, options)
      @resource = RestClient::Resource.new(url, options)
    end

    def post_tar_gz(path, tar_gz_data)
      @resource[path].post(tar_gz_data, :content_type => 'application/x-gzip')
    end
  end
end