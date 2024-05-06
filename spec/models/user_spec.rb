# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#admin?" do
    context "when user has admin role" do
      it "returns true" do
        user = User.new
        user.add_role(:admin)
        expect(user.admin?).to eq(true)
      end
    end

    context "when user doesn't have admin role" do
      it "returns false" do
        user = User.new
        expect(user.admin?).to eq(false)
      end
    end
  end

  describe "associations" do
    it "has many loans" do
      association = described_class.reflect_on_association(:loans)
      expect(association.macro).to eq :has_many
    end
  end

  describe "devise modules" do
    it "includes database authenticatable" do
      expect(described_class.devise_modules).to include(:database_authenticatable)
    end

    it "includes registerable" do
      expect(described_class.devise_modules).to include(:registerable)
    end

    it "includes recoverable" do
      expect(described_class.devise_modules).to include(:recoverable)
    end

    it "includes rememberable" do
      expect(described_class.devise_modules).to include(:rememberable)
    end

    it "includes validatable" do
      expect(described_class.devise_modules).to include(:validatable)
    end
  end
end
