require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "inheritance" do
    it "inherits from ActionController::Base" do
      expect(ApplicationController.superclass).to eq(ActionController::Base)
    end
  end
end
