class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false

      t.datetime :start_date
      t.datetime :end_date

      t.integer :amendements_adopted
      t.integer :amendements_proposed
      t.integer :amendements_signed
      t.integer :commission_interventions
      t.integer :commission_presences
      t.integer :hemicycle_interventions
      t.integer :hemicycle_short_interventions
      t.integer :written_proposals
      t.integer :signed_proposals
      t.integer :oral_questions
      t.integer :written_questions
      t.integer :reports
      t.integer :presence

      t.belongs_to :politician, type: :uuid
      t.timestamps
    end
  end
end
