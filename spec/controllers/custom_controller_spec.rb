# spec/controllers/custom_controller_spec.rb

require 'rails_helper'

RSpec.describe CustomController, type: :controller do
  describe '#create' do
    context 'when user has admin role' do
      let(:admin_user) { create(:user) }

      it 'redirects to root_path' do
        # Set the request format to :html
        @request.env['HTTP_ACCEPT'] = 'text/html'

        # Set the devise_mapping explicitly based on your Devise model
        @request.env['devise.mapping'] = Devise.mappings[:user]

        post :create, params: { user: { email: admin_user.email, password: 'password' } }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user does not have admin role' do
      let(:regular_user) { create(:user) }

      it 'does not redirect to root_path' do
        @request.env['HTTP_ACCEPT'] = 'text/html'
        @request.env['devise.mapping'] = Devise.mappings[:user]

        post :create, params: { user: { email: regular_user.email, password: 'password' } }
      end
    end
end
end
