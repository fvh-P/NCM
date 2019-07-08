# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nickname               :string
#  provider               :string
#  uid                    :string
#

FactoryBot.define do
  factory :user do
    provider { 'mastodon' }
    uid { 'test@example.com' }
    email { 'test@example.com' }
    password { '12345678' }

    trait :shizuka do
      uid { 'shizuka@example.com' }
      email { 'shizuka@example.com' }
    end

    trait :chihaya do
      uid { 'chihaya@example.com' }
      email { 'chihaya@example.com' }
    end

    trait :empty_email do
      email { '' }
    end
  end
end
