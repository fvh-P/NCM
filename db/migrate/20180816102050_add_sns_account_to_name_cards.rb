class AddSnsAccountToNameCards < ActiveRecord::Migration[5.1]
  def change
    add_column :name_cards, :twitter_account_name, :string
    add_column :name_cards, :mastodon_account_name, :string
    add_column :name_cards, :mastodon_instance_name, :string
    add_column :name_cards, :free_account, :string
  end
end
