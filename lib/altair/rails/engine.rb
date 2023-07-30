# frozen_string_literal: true

module Altair
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Altair::Rails

      routes { root to: Altair::Rails.configuration.altair_template }

      config.after_initialize do |app|
        app.routes.prepend do
          mount_path = Altair::Rails.configuration.mount_at
          mount(Engine, at: mount_path, as: :altair) if mount_path.present?
        end
      end
    end
  end
end
