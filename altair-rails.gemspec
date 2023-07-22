# frozen_string_literal: true

require_relative "lib/altair/rails/version"
version = Altair::Rails.version

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "altair-rails"
  s.version     = version
  s.summary     = "Altair GraphQL Client for Rails."
  s.description = "A static version of the Altair GraphQL Client, for Rails and ActionCable subscriptions."

  s.required_ruby_version = ">= 2.7.0"

  s.license = "MIT"

  s.author   = "Jeremy Jackson"
  s.email    = "jejacks0n@gmail.com"
  s.homepage = "https://github.com/jejacks0n/altair-rails"

  s.files        = Dir["CHANGELOG.md", "MIT-LICENSE", "README.md", "lib/**/*", "app/**/*"]
  s.require_path = "lib"

  s.metadata = {
    "homepage_uri"      => s.homepage,
    "source_code_uri"   => s.homepage,
    "bug_tracker_uri"   => s.homepage + "/issues",
    "changelog_uri"     => s.homepage + "/CHANGELOG.md",
    "documentation_uri" => s.homepage + "/README.md",
    "rubygems_mfa_required" => "true",
  }

  s.add_dependency "railties"
end
