# encoding: utf-8
require 'rubygems'
require File.expand_path("../../lib/writepub_editor", __FILE__)

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}


RSpec.configure do |config|
  config.mock_with :rspec
end



