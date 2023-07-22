# frozen_string_literal: true

require "rails"
require "simplecov"

# We need a tiny rails app to test adding our engine to.
module TestApp
  class Application < Rails::Application
    config.eager_load = false
  end
end

SimpleCov.start

require "altair/rails"

# require support libraries
Dir[File.expand_path("../support/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.run_all_when_everything_filtered = true
end
