# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'wally/client/version'

Gem::Specification.new do |s|
  s.name        = "wally-client"
  s.version     = Wally::Client::Version::STRING
  s.authors     = ["Lenny Marks"]
  s.email       = ["lenny@aps.org"]
  s.homepage    = "https://github.com/BBC-News/wally"
  s.summary     = %q{Client gem for the Wally Cucumber feature viewer and navigator}
  s.description = %q{Client gem for the Wally Cucumber feature viewer and navigator}

  s.files         = Dir['lib/**/*.rb'] #+ Dir['bin/*']
  s.files << "README.md"
  s.test_files    = Dir['{test,spec,features}/**']
  s.executables   << 'wally-client'
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'archive-tar-minitar'
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
