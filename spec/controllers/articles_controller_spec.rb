require 'rails_helper'

RSpec.describe ArticlesController do

  describe 'GET #index' do
    context 'when not admin user' do
      it 'redirects to login path' do
        get :index

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when admin user' do
      pending 'Need to implement user login in tests'
    end
  end

end