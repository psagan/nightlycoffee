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
        login_user

        get :index

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #show' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :show, params: {id: article.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user

        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :show, params: {id: article.id}

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