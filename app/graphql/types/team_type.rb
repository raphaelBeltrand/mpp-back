module Types
  class TeamType < Types::BaseObject
    description "Team object"

    field :id, ID, null: false
    field :name, String, null: false
    field :score, Integer, null: false

    field :politicians, [PoliticianType], null: false
    field :user, UserType, null: false
  end
end
