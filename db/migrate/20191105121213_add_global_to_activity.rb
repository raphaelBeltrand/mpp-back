class AddGlobalToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :global, :boolean, default: false
  end
end
