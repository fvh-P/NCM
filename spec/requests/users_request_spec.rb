require 'rails_helper'

describe UsersController, type: :request do
  describe 'GET #show' do
    let(:shizuka) { create(:user, :shizuka) }
    let(:chihaya) { create(:user, :chihaya) }
    before do
      sign_in(shizuka)
    end

    it 'returns HTTP 200' do
      get user_url(id: shizuka.id)
      expect(response.status).to eq(200)
    end

    it 'redirects to my page when requesting other user\'s page' do
      get user_url(id: chihaya.id)
      expect(response).to redirect_to(user_url(id: shizuka.id))
    end
  end
end
