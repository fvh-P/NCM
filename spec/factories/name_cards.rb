FactoryBot.define do
  factory :name_card do
    user_id { 1 }
    name { 'testP' }
    card_name { 'test' }

    trait :shizuka do
      user_id { 1 }
      name { 'shizukaP' }
      card_name { 'test1' }
      association :user, factory: [:user, :shizuka]
    end

    trait :chihaya do
      user_id { 2 }
      name { 'chihayaP' }
      card_name { 'test2' }
      association :user, factory: [:user, :chihaya]
    end

    trait :free_text do
      free_text { 'this is a test' }
    end

    trait :password do
      password { 'password' }
      password_confirmation { 'password' }
    end

    trait :empty_name do
      name { '' }
    end

    trait :empty_card_name do
      card_name { '' }
    end
  end
end
