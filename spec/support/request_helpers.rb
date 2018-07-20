def set_omniauth(service = :mastodon)
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[service] = OmniAuth::AuthHash.new(
    provider: service.to_s,
    uid: "#{Devise.friendly_token(6)}@example.com"
  )

  OmniAuth.config.mock_auth[service]
end

def login_with_omniauth(service = :mastodon)
  visit "/users/auth/#{service.to_s}"
end
