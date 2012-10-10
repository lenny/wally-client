require 'rest_client'

module Wally
  class RestResource
    extend Forwardable
    
    def_delegators :@resource, :[]
    
    def initialize(url, options)
      @resource = RestClient::Resource.new(url, options)
    end

    def post_tar_gz(path, tar_gz_data)
      post(path, tar_gz_data, :content_type => 'application/x-gzip')
    end
    
    def post(path, *args)
      if args.empty?
        with_rescue { resource[path].post({}) }
      else
        with_rescue { resource[path].post(*args) }
      end
    end
    
    def delete(path)
      with_rescue { resource[path].delete }
    end
    
    private
    
    def with_rescue
      yield
    rescue Errno::ECONNREFUSED => e
      raise "failed to connect to #{resource}"
    end
    
    def resource
      @resource
    end
  end
end