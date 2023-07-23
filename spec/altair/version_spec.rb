# frozen_string_literal: true

require "spec_helper"

RSpec.describe Altair::Rails do
  it "has a version number" do
    expect(described_class.version.to_s).to eq("0.0.3")
  end
end
