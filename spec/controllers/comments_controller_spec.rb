require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'initializes a new comment' do
      get :new, params: { post_id: post.id }, xhr: true, format: :js
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end
end
