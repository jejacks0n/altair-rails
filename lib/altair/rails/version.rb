# frozen_string_literal: true

module Altair
  module Rails
    # Returns the currently loaded version as a +Gem::Version+.
    def self.version
      Gem::Version.new(VERSION::STRING)
    end

    module VERSION
      MAJOR = 0
      MINOR = 0
      TINY  = 3
      PRE   = nil

      STRING = [MAJOR, MINOR, TINY, PRE].compact.join(".")
    end
  end
end
