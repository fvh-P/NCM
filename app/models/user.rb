class User < ApplicationRecord
  has_many :received_card, dependent: :destroy
  has_many :name_cards, through: :received_cards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.provider == 'twitter' ? auth.info.nickname : auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.provider == 'twitter' ? auth.info.nickname : auth.uid,
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
