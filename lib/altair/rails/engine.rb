# frozen_string_literal: true

module Altair
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Altair::Rails

      conf = Altair::Rails.configuration
      opts = { at: conf.mount_at, as: :altair }

      routes { root to: conf.altair_template }

      config.after_initialize { |app| app.routes.prepend { mount(Engine, opts) } } if conf.mount_at.present?
    end
  end
end
