require 'wally/commands/base'
require 'wally/tar_gz_util'
require 'fileutils'

module Wally
  module Commands
    class Push < Base
      attr_accessor :project, :dir
      
      def initialize(project, dir, options = {})
        @project = project
        @dir = dir
      end

      def execute
        FileUtils.chdir(dir) do
          content = targz_util.pack(files)
          resource.post_tar_gz("projects/#{project}/pushes", content)
        end
        
      rescue RestClient::ResourceNotFound
        raise Wally::ClientError, "Unknown project \"#{project}\""
      end
      
      private
      
      def targz_util
        Wally::TarGzUtil
      end
      
      def files
        Dir[File.join('**', '*{feature,md,markdown}')] + Dir['.nav']
      end
    end
  end
end