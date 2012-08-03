Dir[File.dirname(__FILE__) + '/support/*.rb'].map {|f| require f }

RSpec.configure do |config|
  config.color_enabled = true
end    