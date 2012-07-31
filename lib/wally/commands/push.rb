require 'wally/commands/base'
require 'wally/tar_gz_util'

module Wally
  module Commands
    class Push < Base
      attr_accessor :project, :dir
      
      def initialize(project, dir, options = {})
        @project = project
        @dir = dir
      end
      
      def execute
        content = targz_util.pack(files)
        resource.post_tar_gz("projects/#{project}/pushes", content)
      rescue RestClient::ResourceNotFound
        raise Wally::ClientError, "Unknown project \"#{project}\""
      end
      
      private
      
      def targz_util
        Wally::TarGzUtil
      end
      
      def files
        Dir[File.join(File.expand_path(dir), '**', '*{feature,md,markdown}')]
      end
    end
  end
end