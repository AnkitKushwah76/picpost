require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      user = create(:user)
      post = create(:post, user: user)
      get :show, params: { id: post.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'initializes a new post' do
      get :new, xhr: true, format: :js
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'DELETE #destroy' do
    let!(:post) { create(:post, user: user) }

    it 'destroys the post' do
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to posts index after deletion' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
    end
  end
end
