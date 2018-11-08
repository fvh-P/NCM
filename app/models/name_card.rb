class NameCard < ApplicationRecord
  belongs_to :user
  has_many :received_cards, dependent: :destroy
  has_many :users, through: :received_cards
  has_many :name_card_idols, dependent: :destroy
  has_many :idols, -> { includes(:name_card_idols).order('name_card_idols.updated_at ASC') }, through: :name_card_idols, autosave: true

  accepts_nested_attributes_for :idols, allow_destroy: true

  mount_uploader :image, ImageUploader
  mount_uploader :image_back, ImageUploader

  validates :card_name, presence: true, uniqueness: { scope: [:user_id] }, length: { maximum: 32 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :free_text, length: { maximum: 1000 }
  validates :password, confirmation: true, length: { maximum: 16 }, on: :create
  validate :mastodon_account_name_validation

  def mastodon_account_name_validation
    if self.mastodon_account_name.present? && self.mastodon_instance_name.blank?
      errors.add(:mastodon_instance_name, 'にインスタンス名を入力してください')
    elsif self.mastodon_account_name.blank? && self.mastodon_instance_name.present?
      errors.add(:mastodon_account_name, 'にユーザ名を入力してください')
    end
  end

  def idols_attributes=(attributes)
    logger.debug(attributes.values)
    attributes.values.uniq { |h| [h['name'], h['_destroy']] }.each do |attr|
      if attr['_destroy'] == 'false'
        i = Idol.find_or_create_by(name: attr['name'])
        idols << i unless name_card_idols.exists?(idol_id: i.id)
      else
        name_card_idols.find_by(idol_id: attr['id'])&.destroy
      end
    end
  end
end
