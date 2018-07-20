class ReceivedCard < ApplicationRecord
  belongs_to :user
  belongs_to :name_card

  validates :name_card_id, uniqueness: { scope: :user_id }
end
