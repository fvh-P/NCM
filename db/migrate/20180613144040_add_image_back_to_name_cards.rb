class AddImageBackToNameCards < ActiveRecord::Migration[5.1]
  def change
    add_column :name_cards, :image_back, :string
  end
end
