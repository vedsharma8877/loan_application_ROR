class Loan < ApplicationRecord
    validates :loan_purpose, presence: true,  length: { minimum: 4, maximum: 100 }
    validates :loan_amount, presence: true
    validates :first_name, presence: true,  length: { minimum: 4, maximum: 100 }
    validates :last_name, presence: true,  length: { minimum: 4, maximum: 100 }
    validates :date_of_birth, presence: true
    validates :phone_number, presence: true,
    format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/, message: 'format should be (XXX) XXX-XXXX' }
    validates :email, presence: true
    validates :ssn, presence: true, format: { with: /\A\d{3}-\d{2}-\d{4}\z/, message: 'format should be XXX-XX-XXXX' }
    validates :street_address, presence: true, length: { minimum: 4, maximum: 100 }
    validates :city, presence: true, length: { maximum: 50 }
    validates :state, presence: true, length: { maximum: 50 }
    validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
    validates :annual_income, presence: true
    validates :employer_name, presence: true, length: { maximum: 100 }
    validates :employer_phone, presence: true,
    format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/, message: 'format should be (XXX) XXX-XXXX' }
end