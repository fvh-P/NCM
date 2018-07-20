class NameCardIdol < ApplicationRecord
  belongs_to :name_card
  belongs_to :idol

  validates :idol_id, presence: true, uniqueness: { scope: [:name_card_id] }
end
