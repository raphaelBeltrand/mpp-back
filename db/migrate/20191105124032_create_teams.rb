class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.string :name
      t.integer :score, default: 0
      t.belongs_to :group_user, type: :uuid

      t.timestamps
    end
  end
end
