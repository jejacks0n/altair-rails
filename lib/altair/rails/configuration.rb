# frozen_string_literal: true

module Altair
  module Rails
    class Configuration
      include Singleton

      cattr_accessor(*[
        :mount_at,
        :graphql_path,
        :action_cable_path,
        :altair_options,
        :altair_version,
        :altair_template
      ])

      # Where you want to mount the engine in your application. If set to nil,
      # the engine will not be mounted automatically and it will need to be
      # mounted manually. E.g.: in your routes.rb file, adding:
      #   mount Altair::Rails::Engine => "/altair"`
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
      @@altair_version = "5.0.28" # Altair::Rails.version

      # Generally this should be left to the release version of altair-rails,
      # but if you really want, you can override it here.
      @@altair_template = ->(env) do
        [200, {}, <<~HTML_BODY]
          <!DOCTYPE html>
          <html>
          <head>
            <meta charset="utf-8" />
            <title>Altair</title>
            <base href="https://cdn.jsdelivr.net/npm/altair-static@#{altair_version}/build/dist/">
            <meta name="viewport" content="width=device-width,initial-scale=1" />
            <link href="styles.css" rel="stylesheet" />
            <style>.loading-screen { display: none }</style>
          </head>
          <body>
          <script>
            // window.__ALTAIR_WEB_APP__ = 1;
            const defaultOptions = {
              endpointURL: window.location.origin + "#{graphql_path}",
              subscriptionsEndpoint: "ws://" + window.location.host + "#{action_cable_path}",
              initialSubscriptionsProvider: "action-cable"
            };
            document.addEventListener('DOMContentLoaded', function() {
              AltairGraphQL.init(Object.assign({}, defaultOptions, #{altair_options.to_json}));
            });
          </script>
          <app-root>
            <div class="loading-screen styled">
              <div class="loading-screen-inner">
                <div class="loading-screen-logo-container">
                  <img src="assets/img/logo_350.svg" alt="Altair" />
                </div>
                <div class="loading-screen-loading-indicator">
                  <span class="loading-indicator-dot"></span>
                  <span class="loading-indicator-dot"></span>
                  <span class="loading-indicator-dot"></span>
                </div>
              </div>
            </div>
          </app-root>
          <script rel="preload" as="script" type="text/javascript" src="runtime.js"></script>
          <script rel="preload" as="script" type="text/javascript" src="polyfills.js" ></script>
          <script rel="preload" as="script" type="text/javascript" src="main.js" ></script>
          </body>
          </html>
        HTML_BODY
      end
    end

    mattr_accessor :configuration
    @@configuration = Configuration

    def self.configure
      yield @@configuration
    end

    singleton_class.send(:alias_method, :setup, :configure)
  end
end
