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

class User < ApplicationRecord
  has_many :received_card, dependent: :destroy
  has_many :name_cards, through: :received_cards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.where(nickname: auth.provider == 'twitter' ? auth.info.nickname : auth.uid, provider: auth.provider).first
      if user
        user.update!(uid: auth.uid)
      end
    end

    unless user
      user = User.create(
        uid:      auth.uid,
        nickname: auth.provider == 'twitter' ? auth.info.nickname : auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
      user.save!
    end
    current_user = user
  end

  private

  def self.dummy_email(auth)
    auth.provider == 'twitter' ? "#{auth.info.nickname}@twitter.com" : auth.uid
  end
end
