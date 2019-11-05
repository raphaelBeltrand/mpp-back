class CreatePoliticianTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :politician_teams do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.belongs_to :politician, type: :uuid
      t.belongs_to :team, type: :uuid

      t.timestamps
    end
  end
end
