class AddPasswordToNameCards < ActiveRecord::Migration[5.1]
  def change
    add_column :name_cards, :password, :string
  end
end
