# Altair Rails - The Altair GraphQL Client for Rails

[![Gem Version](https://img.shields.io/gem/v/altair-rails.svg?label=gem%20version)](https://rubygems.org/gems/altair-rails)
[![MIT License](https://img.shields.io/github/license/jejacks0n/altair-rails.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/github/actions/workflow/status/jejacks0n/altair-rails/ci.yml.svg?label=build%20status)](https://github.com/jejacks0n/altair-rails/actions/workflows/ci.yml)
[![Maintainability](https://img.shields.io/codeclimate/coverage-letter/jejacks0n/altair-rails.svg?label=maintainability)](https://codeclimate.com/github/jejacks0n/altair-rails/maintainability)
[![Test Coverage](https://img.shields.io/codeclimate/coverage/jejacks0n/altair-rails.svg?label=test%20coverage)](https://codeclimate.com/github/jejacks0n/altair-rails/test_coverage)
[![RubyGems](https://img.shields.io/gem/dt/altair-rails.svg?label=rubygems%20downloads)](https://rubygems.org/gems/altair-rails)

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

## Similar Projects

I created this project after battling GraphQL subscriptions, and GraphiQLs lack of support for ActionCable.

That being said, there are still great projects worth checking out:

- [graphiql-rails](https://github.com/rmosolgo/graphiql-rails) - A Rails engine that provides a mountable endpoint for GraphiQL.

## License

This project is released under the MIT license:

* https://opensource.org/licenses/MIT

Copyright 2023 [jejacks0n](https://github.com/jejacks0n)

## Make Code Not War

[![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)