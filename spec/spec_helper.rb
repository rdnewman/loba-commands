require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'loba_commands'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
