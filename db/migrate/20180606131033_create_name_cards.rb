class CreateNameCards < ActiveRecord::Migration[5.1]
  def change
    create_table :name_cards do |t|
      t.integer :user_id, null: false, index: true
      t.string :name, null: false
      t.string :free_text, limit: 1000
      t.string :image

      t.timestamps
    end
  end
end
