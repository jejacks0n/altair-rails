# frozen_string_literal: true

require "spec_helper"

RSpec.describe Altair::Rails::Engine do
  before(:all) do
    Rails.application.initialize!
  end

  it "adds itself to the routes of the application" do
    expect(Rails.application.routes.named_routes.route_defined?(:altair_path)).to be_truthy
  end
end
