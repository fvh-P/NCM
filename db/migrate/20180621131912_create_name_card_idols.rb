class CreateNameCardIdols < ActiveRecord::Migration[5.1]
  def change
    create_table :name_card_idols do |t|
      t.references :name_card, index: true, foreign_key: true
      t.references :idol, index: true, foreign_key: true

      t.timestamps
    end
  end
end
