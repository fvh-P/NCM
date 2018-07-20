class CreateReceivedCards < ActiveRecord::Migration[5.1]
  def change
    create_table :received_cards do |t|
      t.references :user, null: false, index: true
      t.references :name_card, null: false
      t.timestamps null: false
    end
  end
end
