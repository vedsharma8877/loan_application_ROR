class LoansController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def show; end

  def index
    if user_signed_in?
      @loans = if current_user.has_role?(:admin)
                 Loan.all
               else
                 current_user.loans
               end
    else
      flash[:alert] = 'You have to sign up or login before accessing this page.'
      redirect_to new_user_session_path
    end
  end

  def new
    if user_signed_in?
      @loan = current_user.loans.build
    else
      flash[:alert] = 'You have to sign up or login before creating a new loan.'
      redirect_to new_user_session_path
    end
  end

  def edit; end

  def create
    @loan = current_user.loans.build(loan_params)
    if @loan.save
      flash[:notice] = 'Application has been created successfully.'
      redirect_to @loan
    else
      puts "Errors: #{@loan.errors.full_messages}"
      redirect_to new_loan_path, alert: @loan.errors.full_messages.join(', ')
    end
  end

  def update
    if @loan.update(loan_params)
      flash[:notice] = 'Application has been updated successfully.'
      redirect_to loan_path
    else
      redirect_to edit_loan_path, alert: @loan.errors.full_messages.join(', ')
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    flash[:alert] = 'Application has been deleted successfully.'
    redirect_to loans_path
  end

  private

  def set_user
    @loan = Loan.find(params[:id])
  end
  
    def loan_params
      params.require(:loan).permit(
        :loan_purpose,
        :loan_amount,
        :first_name,
        :last_name,
        :date_of_birth,
        :phone_number,
        :email,
        :ssn,
        :street_address,
        :city,
        :state,
        :zip,
        :annual_income,
        :employer_name,
        :employer_phone,
      )
    end
  end
  