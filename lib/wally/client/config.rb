module Wally
  module Client
    class Config
      class << self
        attr_accessor :url

        def configure(settings = {})
          settings.each_pair do |k, v|
            send("#{k}=", v) if respond_to?("#{k}=")
          end
        end
      end
    end
  end
end