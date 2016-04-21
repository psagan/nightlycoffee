require 'rails_helper'

# @todo - will need some tests for json api - in requests directory
RSpec.describe BackendController do
  describe 'GET #index' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        get :index

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user

        get :index

        expect(response).to have_http_status(200)
      end
    end
  end

  private

  def login_user
    user = FactoryGirl.create(:user)
    sign_in(user)
  end
end