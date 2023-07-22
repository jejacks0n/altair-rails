# frozen_string_literal: true

require "spec_helper"

RSpec.describe Altair::Rails do
  it "can be configured" do
    described_class.configure { |config| config.mount_at = "/new_mount_path" }

    expect(described_class.configuration.mount_at).to eq("/new_mount_path")
  ensure
    described_class.configure { |config| config.mount_at = "/altair" }
  end

  it "can be configured using .setup" do
    expect(described_class).to respond_to(:setup)
  end

  it "has the expected configuration defaults" do
    config = described_class.configuration

    expect(config.mount_at).to eq("/altair")
    expect(config.graphql_path).to eq("/graphql")
    expect(config.action_cable_path).to eq("/cable")
    expect(config.altair_options).to eq({})
    expect(config.altair_version).to eq("5.0.28")
  end

  it "renders the correct template" do
    response = described_class.configuration.altair_template.call({})
    expect(response[0]).to eq(200)
    expect(response[1]).to eq({})
    expect(response[2]).to include("altair-static@5.0.28")
  end
end
