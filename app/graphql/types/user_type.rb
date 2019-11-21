module Types
  class UserType < Types::BaseObject
    description "User object"

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :authentication_token, String, null: false

    field :avatar, String, null: true

    field :groups, [GroupType], null: false
    field :teams, [TeamType], null: false

    def avatar
      object.avatar_url
    end
  end
end
