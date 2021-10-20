$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails'
require 'dotenv/beefy'
require_relative './support/mock_filesystem_helpers'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include MockFileSystemHelpers

  config.before(:each) do
    # Clear the ENV between test runs. Otherwise it's memoized and not overwritten!
    ENV.each do |k,v|
      ENV[k] = nil
    end

    ENV['RAILS_ENV'] = 'test'
  end
end
