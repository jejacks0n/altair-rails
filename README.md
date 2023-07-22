# Altair Rails - The Altair GraphQL Client for Rails

[![Gem Version](https://badge.fury.io/rb/altair-rails.svg)](https://badge.fury.io/rb/altair-rails)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![Maintainability](https://api.codeclimate.com/v1/badges/22128c5c828a8eed6f95/maintainability)](https://codeclimate.com/github/jejacks0n/altair-rails/maintainability)

Altair Rails is a Rails engine that provides a mountable endpoint for the [Altair GraphQL Client](https://altairgraphql.dev/).

## Download and Installation

Add this line to your Gemfile:

```ruby
gem "altair-rails"
```

Or install the latest version with RubyGems:

```bash
gem install altair-rails
```

Source code can be downloaded as part of the project on GitHub:

* https://github.com/jejacks0n/altair-rails

## Configuration

By default the Altair GraphQL Client is mounted at `/altair`. It can be configured by adding an initializer to your Rails application:

```ruby 
Altair::Rails.configure do |config|
  # Where you want to mount the engine in your application. If set to nil,
  # the engine will not be mounted automatically and it will need to be
  # mounted manually. E.g.: in your routes.rb file, adding:
  #   mount Altair::Rails::Engine => "/altair"`
  config.mount_at = "/altair"

  # The path to your GraphQL endpoint. This is used to set the endpointURL.
  config.graphql_path = "/graphql"

  # The path to your ActionCable endpoint. This is used to set the
  # subscriptionsEndpoint.
  config.action_cable_path = "/cable"

  # Any options you want to pass to AltairGraphQL.init(). For more details:
  # https://github.com/altair-graphql/altair/blob/f433ee1bf6c52c8639b6448fa7e0c31c6ad955d1/packages/altair-core/src/config.ts
  config.altair_options = {}
end
```

## License

Active Experiment is released under the MIT license:

* https://opensource.org/licenses/MIT

Copyright 2023 [jejacks0n](https://github.com/jejacks0n)

## Make Code Not War