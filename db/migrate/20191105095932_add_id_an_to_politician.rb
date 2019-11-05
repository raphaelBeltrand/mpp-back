class AddIdAnToPolitician < ActiveRecord::Migration[6.0]
  def change
    add_column :politicians, :id_an, :string
  end
end
