module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignIn
    field :register_user, mutation: Mutations::RegisterUser

    field :create_group, mutation: Mutations::Group::CreateGroup
    field :join_group, mutation: Mutations::Group::JoinGroup
    field :delete_group, mutation: Mutations::Group::DeleteGroup

    field :create_team, mutation: Mutations::Team::CreateTeam
    field :add_politician, mutation: Mutations::Team::AddPolitician
    field :update_politician, mutation: Mutations::Team::UpdatePolitician
    field :delete_team, mutation: Mutations::Team::DeleteTeam
  end
end
