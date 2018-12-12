class RenameUidColumnToNickname < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :uid, :nickname
  end
end
