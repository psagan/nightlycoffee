require 'rails_helper'

RSpec.describe ArticlesController do

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
        user = FactoryGirl.create(:user)
        sign_in(user)

        get :index

        expect(response).to have_http_status(200)
      end
    end
  end

end