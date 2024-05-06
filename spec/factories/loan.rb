# frozen_string_literal: true

# spec/factories/loans.rb

FactoryBot.define do
  factory :loan do
    first_name { 'First Name' }
    last_name { 'Last Name' }
    email { 'loan@example.com' }
    loan_amount { 1000 }
    loan_purpose { 'Mortgage' }
    date_of_birth { Date.parse('1990-01-01') }
    ssn { '123-45-6789' }
    phone_number { '(787) 472-5353' }
    street_address { 'Test street' }
    city { 'Test city' }
    state { 'Test state' }
    zip { 12_345 }
    annual_income { 1000 }
    employer_name { 'Employer Name' }
    employer_phone { '(787) 472-5353' }
  end
  factory :invalid_loan, class: 'Loan' do
    first_name { nil }
    last_name { nil }
    email { 'invalid_email' }
    loan_amount { -1000 }
    loan_purpose { nil }
    date_of_birth { Date.parse('2100-01-01') }
    ssn { 'invalid_ssn' }
    phone_number { 'invalid_ssn' }
    street_address { nil }
    city { nil }
    state { nil }
    zip { nil }
    annual_income { nil }
    employer_name { nil }
    employer_phone { nil }
  end
end
