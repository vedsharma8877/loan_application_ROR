# spec/channels/application_channel_spec.rb
require 'rails_helper'

RSpec.describe ApplicationCable::Channel, type: :channel do
  # You can define your test cases here
  # Example:
  it "subscribes to the channel" do
    subscribe
    expect(subscription).to be_confirmed
  end
end
