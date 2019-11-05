module Types
  class GroupType < Types::BaseObject
    description "Group object"

    field :id, ID, null: false
    field :name, String, null: false
    field :public, Boolean, null: false

    field :users, [UserType], null: false
  end
end
