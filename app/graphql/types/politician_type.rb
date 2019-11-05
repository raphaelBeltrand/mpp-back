module Types
  class PoliticianType < Types::BaseObject
    description "Politician object"

    field :id, ID, null: false
    field :name, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :gender, String, null: true
    field :dob, Integer, null: true
    field :pob, String, null: true
    field :department, String, null: true
    field :circonscription, String, null: true
    field :circonscription_number, String, null: true
    field :mandat_start, Integer, null: true
    field :group_sigle, String, null: true
    field :party_name, String, null: true
    field :email, String, null: true
    field :collaborators, [String], null: true
    field :profession, String, null: true
    field :hemicycle_place, String, null: true
    field :slug, String, null: true
    field :url_an, String, null: true
    field :mandat_number, String, null: true
    field :twitter, String, null: true
    field :id_an, String, null: true

    field :party, PartyType, null: false
    field :activities, [ActivityType], null: false
  end
end
