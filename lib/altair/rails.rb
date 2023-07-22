# frozen_string_literal: true

require "altair/rails/version"
require "altair/rails/configuration"
require "altair/rails/engine"

module Altair
  module Rails
    mattr_accessor :configuration
    @@configuration = Configuration

    def self.configure
      yield @@configuration
    end

    singleton_class.send(:alias_method, :setup, :configure)
  end
end