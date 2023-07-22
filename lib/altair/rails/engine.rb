# frozen_string_literal: true

module Altair
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Altair::Rails

      altair_rails = Altair::Rails.configuration

      if altair_rails.mount_at.present?
        config.after_initialize do |app|
          app.routes.prepend { mount Altair::Rails::Engine => altair_rails.mount_at }
        end
      end

      routes do
        root to: ->(_) { [200, {}, <<~HTML_BODY] }
          <!DOCTYPE html>
          <html>
          <head>
            <meta charset="utf-8" />
            <title>Altair</title>
            <base href="https://cdn.jsdelivr.net/npm/altair-static@#{altair_rails.altair_version}/build/dist/">
            <meta name="viewport" content="width=device-width,initial-scale=1" />
            <link href="styles.css" rel="stylesheet" />
            <style>.loading-screen { display: none }</style>
          </head>
          <body>
          <script>
            // window.__ALTAIR_WEB_APP__ = 1;
            const defaultOptions = {
              endpointURL: window.location.origin + "#{altair_rails.graphql_path}",
              subscriptionsEndpoint: "ws://" + window.location.host + "#{altair_rails.action_cable_path}",
              initialSubscriptionsProvider: "action-cable"
            };
            document.addEventListener('DOMContentLoaded', function() {
              AltairGraphQL.init(Object.assign({}, defaultOptions, #{altair_rails.altair_options.to_json})); 
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
  end
end