# == Schema Information
#
# Table name: idols
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Idol < ApplicationRecord
  has_many :name_card_idols
  has_many :name_cards, through: :name_card_idols

  validates :name, uniqueness: true
end
