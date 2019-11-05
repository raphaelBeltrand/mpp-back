class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.string :name
      t.string :slug
      t.string :acronym, unique: true
      t.string :color

      t.timestamps
    end

    add_reference :politicians, :party, type: :uuid
  end
end
