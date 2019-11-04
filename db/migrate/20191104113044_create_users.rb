class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension "uuid-ossp"
    create_table :users do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
