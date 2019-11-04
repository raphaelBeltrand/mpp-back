class CreateGroupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_users do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.belongs_to :user, type: :uuid
      t.belongs_to :group, type: :uuid

      t.integer :score, default: 0

      t.timestamps
    end
  end
end
