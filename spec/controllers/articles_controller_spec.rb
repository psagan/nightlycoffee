# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

# @todo - will need some tests for json api - in requests directory
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

        get :show, params: {id: article.id, format: :json}

        # json unauthrorized
        expect(response).to have_http_status(401)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :show, params: {id: article.id, format: :json}

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #new' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :new

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :new

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #edit' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :edit, params: {id: article.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = double(:article, id: 1)
        allow(Article).to receive(:find).and_return(article)

        get :edit, params: {id: article.id}

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST #create' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        post :create, params: {article: {title: 'test', content: 'test'}}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = FactoryGirl.create(:article)
        allow(Article).to receive(:new).and_return(article)
        allow(article).to receive(:save).and_return(true)

        post :create, params: {article: {title: 'test', content: 'test'}}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(article_path(article))
      end
    end
  end

  describe 'POST #update' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        article = FactoryGirl.create(:article)
        post :update, params: {article: {title: 'test', content: 'test'}, id: article.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = FactoryGirl.create(:article)
        allow(article).to receive(:update).and_return(true)
        allow(Article).to receive(:find).and_return(article)

        post :update, params: {article: {title: 'test', content: 'test'}, id: article.id, format: :json}

        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when not signed in user' do
      it 'redirects to login path' do
        article = FactoryGirl.create(:article)
        delete :destroy, params: {id: article.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when signed in user' do
      it 'can access page' do
        login_user
        article = FactoryGirl.create(:article)

        delete :destroy, params: {id: article.id}

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(articles_path)
      end
    end
  end


  private

  def login_user
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

end
