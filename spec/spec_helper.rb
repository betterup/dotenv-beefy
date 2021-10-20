$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails'
require 'dotenv/beefy'
require_relative './support/mock_filesystem_helpers'

RSpec.configure do |config|
  config.include MockFileSystemHelpers
end
