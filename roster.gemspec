$LOAD_PATH.unshift File.expand_path("/lib", __FILE__)
# require 'test'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'zb_roster'
  s.version     = "0.0.1" 
  s.date        = '2013-03-07'
  s.summary     = "swim lesson roster builder"
  s.description = "build a swim lesson roster"
  s.authors     = ["Zachary Bryan"]
  s.email       = 'zachx1@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/zb_roster'
  s.files       = ["lib/classlist.rb", "lib/kid.rb"]
  s.executables << 'roster'
end