module Types
  class GroupUserType < Types::BaseObject
    description "GroupUser object"

    field :id, ID, null: false
    field :group, GroupType, null: false
    field :user, UserType, null: false
    field :score, Integer, null: false
  end
end
