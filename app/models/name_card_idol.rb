# == Schema Information
#
# Table name: name_card_idols
#
#  id           :bigint           not null, primary key
#  name_card_id :bigint
#  idol_id      :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class NameCardIdol < ApplicationRecord
  belongs_to :name_card
  belongs_to :idol

  validates :idol_id, presence: true, uniqueness: { scope: [:name_card_id] }
end
