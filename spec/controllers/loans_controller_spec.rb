# frozen_string_literal: true

# spec/controllers/loans_controller_spec.rb

require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let(:user) { create(:user) }
  let(:admin_user) { create(:user, :admin) }
  let(:loan_params) { attributes_for(:loan) }

  describe '#index' do
    let(:user) { create(:user) } 
    let(:admin_user) { create(:user, :admin) } 

    context 'when not signed in' do
      it 'redirects to sign-in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in' do
      before do
        sign_in user
      end

      it 'renders the index template for signed-in users' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'assigns loans to @loans for admin users' do
        sign_in admin_user
        get :index
        expect(assigns(:loans)).to eq(Loan.all)
      end

      it 'assigns user loans to @loans for non-admin users' do
        get :index
        expect(assigns(:loans)).to eq(user.loans)
      end
    end
  end
  describe '#new' do
    context 'when not signed in' do
      it 'redirects to sign-in page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'displays an alert message' do
        get :new
        expect(flash[:alert]).to eq('You have to sign up or login before creating a new loan.')
      end
    end

    context 'when signed in' do
      before do
        sign_in user
      end

      it 'builds a new loan for the current user' do
        get :new
        expect(assigns(:loan)).to be_a_new(Loan)
        expect(assigns(:loan).user_id).to eq(user.id)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end
  end
  describe '#create' do
    it 'creates a new loan for signed-in users with valid parameters' do
      sign_in user
      expect do
        post :create, params: { loan: loan_params }
      end.to change(Loan, :count).by(1)
      expect(response).to redirect_to(Loan.last)
    end
  end
  describe '#destroy' do
    let(:loan) { instance_double('Loan', destroy: true) }

    before do
      allow(Loan).to receive(:find).and_return(loan)
    end

    it 'destroys the loan and redirects to loans index with an alert' do
      delete :destroy, params: { id: 1 }

      expect(flash[:alert]).to eq('Application has been deleted successfully.')
      expect(response).to redirect_to(loans_path)
    end

    it 'finds the correct loan and calls destroy on it' do
      expect(Loan).to receive(:find).with('1').and_return(loan)
      expect(loan).to receive(:destroy)

      delete :destroy, params: { id: 1 }
    end
  end
  describe '#update' do
    let(:loan) do
      instance_double('Loan', id: 1, update: false, errors: double('Errors', full_messages: ['Some error']))
    end

    before do
      allow(Loan).to receive(:find).and_return(loan)
    end

    context 'when the loan is successfully updated' do
      it 'redirects to the loan show page with a notice' do
        allow(loan).to receive(:update).and_return(true)

        put :update, params: { id: 1, loan: { attribute: 'new_value' } }

        expect(flash[:notice]).to eq('Application has been updated successfully.')
        expect(response).to redirect_to(loan_path(loan.id))
      end
    end

    context 'when the loan update fails' do
      it 'redirects to edit_loan_path with an alert' do
        allow(loan).to receive(:update).and_return(false)

        put :update, params: { id: 1, loan: { attribute: 'new_value' } }

        expect(response).to redirect_to(edit_loan_path(loan.id))
        expect(flash[:alert]).to eq('Some error') # Check for the specific error message
      end
    end
  end
end
