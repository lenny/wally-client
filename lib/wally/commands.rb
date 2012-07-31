require 'wally/commands/push'
require 'wally/commands/add_project'

module Wally
  module Commands
    class << self
      def add_project(project)
        AddProject.new(project).execute
      end
      
      def push(project, dir, options = {})
        Push.new(project, dir, options).execute
      end
    end
  end
end