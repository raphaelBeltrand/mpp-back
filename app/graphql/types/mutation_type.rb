module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignIn
    field :register_user, mutation: Mutations::RegisterUser
  end
end
