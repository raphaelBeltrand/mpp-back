class CreatePoliticians < ActiveRecord::Migration[6.0]
  def change
    create_table :politicians do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.string :name

      t.timestamps
    end
  end
end
