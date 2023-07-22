# frozen_string_literal: true

module Altair
  module Rails
    class Configuration
      include Singleton

      cattr_accessor(*[:mount_at, :graphql_path, :action_cable_path, :altair_options, :altair_version])

      # Where you want to mount the engine in your application. If set to nil,
      # the engine will not be mounted automatically and it will need to be
      # mounted manually. E.g.: in your routes.rb file, adding:
      #   mount Altair::Rails::Engine => "/altair"`
      #
      # Defaults to "/altair".
      @@mount_at = "/altair"

      # The path to your GraphQL endpoint. This is used to set the endpointURL.
      @@graphql_path = "/graphql"

      # The path to your ActionCable endpoint. This is used to set the
      # subscriptionsEndpoint.
      @@action_cable_path = "/cable"

      # Any options you want to pass to AltairGraphQL.init(). For more details:
      # https://github.com/altair-graphql/altair/blob/f433ee1bf6c52c8639b6448fa7e0c31c6ad955d1/packages/altair-core/src/config.ts
      @@altair_options = {}

      # Generally this should be left to the release version of altair-rails,
      # but if you really want, you can override it here.
      @@altair_version = Altair::Rails.version
    end
  end
end
