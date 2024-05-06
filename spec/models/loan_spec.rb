require 'rails_helper'

RSpec.describe Loan, type: :model do
  # Test loan_purpose validations
  describe "loan_purpose validations" do
    it { should validate_presence_of(:loan_purpose) }
    it { should validate_length_of(:loan_purpose).is_at_least(4) }
    it { should validate_length_of(:loan_purpose).is_at_most(100) }
  end

  # Test loan_amount validation
  describe "loan_amount validation" do
    it { should validate_presence_of(:loan_amount) }
  end

  # Test borrower information validations
  describe "borrower information validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(4) }
    it { should validate_length_of(:first_name).is_at_most(100) }

    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(4) }
    it { should validate_length_of(:last_name).is_at_most(100) }

    it { should validate_presence_of(:date_of_birth) }
  end

  # Test phone_number validation
  describe "phone_number validation" do
    it "validates the format of phone_number" do
      loan = Loan.new(phone_number: "1234567890")
      loan.valid?
      expect(loan.errors[:phone_number]).to include("format should be (XXX) XXX-XXXX")
    end
  end

  # Test email validation
  describe "email validation" do
    it { should validate_presence_of(:email) }
  end

  # Test SSN validation
  describe "ssn validation" do
    it "validates the format of SSN" do
      loan = Loan.new(ssn: "123456789")
      loan.valid?
      expect(loan.errors[:ssn]).to include("format should be XXX-XX-XXXX")
    end
  end

  # Test address validations
  describe "address validations" do
    it { should validate_presence_of(:street_address) }
    it { should validate_length_of(:street_address).is_at_least(4) }
    it { should validate_length_of(:street_address).is_at_most(100) }

    it { should validate_presence_of(:city) }
    it { should validate_length_of(:city).is_at_most(50) }

    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_at_most(50) }

    it "validates the presence of zip" do
      should validate_presence_of(:zip)
    end
    it "validates that zip is a numerical integer" do
      should validate_numericality_of(:zip).only_integer
    end
    it "validates the format of zip" do
      loan = Loan.new(zip: "12345") # Replace with a valid zip format
      loan.valid?
      expect(subject.errors[:zip]).to_not include("format should be XXXXX")
    end
  end

  # Test income and employer information validations
  describe "income and employer information validations" do
    it { should validate_presence_of(:annual_income) }

    it { should validate_presence_of(:employer_name) }
    it { should validate_length_of(:employer_name).is_at_most(100) }

    it "validates the format of employer_phone" do
      loan = Loan.new(employer_phone: "1234567890")
      loan.valid?
      expect(loan.errors[:employer_phone]).to include("format should be (XXX) XXX-XXXX")
    end
  end
end
