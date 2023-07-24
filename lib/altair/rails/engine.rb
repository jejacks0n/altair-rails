# frozen_string_literal: true

module Altair
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Altair::Rails

      routes { root to: Altair::Rails.configuration.altair_template }

      if Altair::Rails.configuration.mount_at.present?
        config.after_initialize do |app|
          app.routes.prepend do
            mount(Engine, at: Altair::Rails.configuration.mount_at, as: :altair)
          end
        end
      end
    end
  end
end
