module Types
  class ActivityType < Types::BaseObject
    description "Activity object"

    field :id, ID, null: false
    field :start_date, Integer, null: true
    field :end_date, Integer, null: true
    field :amendements_adopted, Integer, null: true
    field :amendements_proposed, Integer, null: true
    field :amendements_signed, Integer, null: true
    field :commission_interventions, Integer, null: true
    field :commission_presences, Integer, null: true
    field :hemicycle_interventions, Integer, null: true
    field :hemicycle_short_interventions, Integer, null: true
    field :written_proposals, Integer, null: true
    field :signed_proposals, Integer, null: true
    field :oral_questions, Integer, null: true
    field :written_questions, Integer, null: true
    field :reports, Integer, null: true
    field :presence, Integer, null: true
  end
end
