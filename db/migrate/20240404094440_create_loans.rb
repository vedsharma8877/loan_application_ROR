class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans do |t|
      t.string :loan_purpose
      t.string :loan_amount
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number
      t.string :email
      t.string :ssn
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :annual_income
      t.string :employer_name
      t.string :employer_phone
      t.timestamps
    end
  end
end
