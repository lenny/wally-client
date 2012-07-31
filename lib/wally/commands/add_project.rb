require 'wally/commands/base'

module Wally
  module Commands
    class AddProject < Base
      attr_accessor :project

      def initialize(project)
        @project = project
      end

      def execute
        response = resource["projects/#{project}"].post(project)
      rescue RestClient::Conflict
        raise ClientError, "Project \"#{project}\" already exists"
      end
    end
  end
end