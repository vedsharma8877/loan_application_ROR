require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  describe "connection" do
    it "inherits from ActionCable::Connection::Base" do
      expect(ApplicationCable::Connection.superclass).to eq(ActionCable::Connection::Base)
    end
  end
end
