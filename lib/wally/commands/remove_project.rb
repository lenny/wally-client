require 'wally/commands/base'

module Wally
  module Commands
    class RemoveProject < Base
      attr_accessor :project

      def initialize(project)
        @project = project
      end

      def execute
        resource.delete("projects/#{project}")
      end
    end
  end
end