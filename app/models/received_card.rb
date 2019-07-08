# == Schema Information
#
# Table name: received_cards
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  name_card_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ReceivedCard < ApplicationRecord
  belongs_to :user
  belongs_to :name_card

  validates :name_card_id, uniqueness: { scope: :user_id }
end
