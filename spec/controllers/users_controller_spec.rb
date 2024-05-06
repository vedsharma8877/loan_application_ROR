require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #index' do
    it 'assigns all users to @users and renders the index template' do
      user1 = create(:user)
      user2 = create(:user)
      sign_in user1
      get :index
      expect(assigns(:users)).to eq([user1, user2])
      expect(response).to render_template(:index)
    end
  end
  describe "DELETE #destroy" do
    let(:admin_user) { create(:user, :admin) }
    let(:user) { create(:user) }

    context "when user is logged in as admin" do
      before do
        sign_in admin_user
      end

      it "destroys the user if they have no active loans" do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(users_path)
        expect(flash[:notice]).to eq('User has been successfully deleted.')
      end

      it "redirects with alert message if user has active loans" do
        loan = create(:loan, user_id: user.id) # Update this line
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(users_path)
        expect(flash[:alert].squish).to eq("If a user has an active loan request, they cannot be deleted.")
      end
    end
  end
end
