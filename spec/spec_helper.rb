# encoding: utf-8
require 'rubygems'
require File.expand_path("../../lib/writepub_editor", __FILE__)

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}


RSpec.configure do |config|
  config.mock_with :rspec
  
  config.before(:suite) do
    DOMAIN_NAME = "google.com" if !defined?(DOMAIN_NAME)
  end
end



