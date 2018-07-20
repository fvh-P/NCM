class AddCardNameToNameCards < ActiveRecord::Migration[5.1]
  def change
    add_column :name_cards, :card_name, :string, limit: 32
  end
end
