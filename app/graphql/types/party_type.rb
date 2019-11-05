module Types
  class PartyType < Types::BaseObject
    description "Party object"

    field :id, ID, null: false
    field :name, String, null: false
    field :acronym, String, null: false
    field :color, String, null: false
    field :slug, String, null: false

    field :politicians, [PoliticianType], null: false
  end
end
