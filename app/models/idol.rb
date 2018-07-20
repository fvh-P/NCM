class Idol < ApplicationRecord
  has_many :name_card_idols
  has_many :name_cards, through: :name_card_idols

  validates :name, uniqueness: true
end
