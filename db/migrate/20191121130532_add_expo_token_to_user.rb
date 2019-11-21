class AddExpoTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :expo_toker, :string
  end
end
