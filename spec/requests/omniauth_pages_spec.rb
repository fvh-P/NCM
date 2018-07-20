require 'rails_helper'

describe 'Omniauth pages' do

  describe 'with mastodon oauth' do

    context 'valid oauth signin' do
      let(:oauth_user) { set_omniauth(:mastodon) }
      before do
        Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
        Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:mastodon]
        login_with_omniauth(oauth_user.provider)
      end
      let(:user) { User.where(provider: oauth_user.provider, uid: oauth_user.uid).first }

      it { expect(user).not_to eq nil }
      it { expect(user.provider).to eq oauth_user.provider }
      it { expect(user.uid).to eq oauth_user.uid }
    end
  end
end
