FactoryBot.define do
  factory :user do
    provider 'example.com'
    uid 'test@example.com'
    email 'test@example.com'
    password '12345678'

    trait :shizuka do
      uid 'shizuka@example.com'
      email 'shizuka@example.com'
    end

    trait :chihaya do
      uid 'chihaya@example.com'
      email 'chihaya@example.com'
    end

    trait :empty_email do
      email ''
    end
  end
end
