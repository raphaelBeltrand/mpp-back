class Mutations::SignIn < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true

  def resolve(args)
    @user = User.find_for_database_authentication(email: args[:email])
    if @user
      if @user.valid_password?(args[:password])
        authentication_token = @user.create_authentication_token
        return { user: @user }
        # {authentication_token}
      else
        GraphQL::ExecutionError.new("Incorrect Email/Password")
      end
    else
      GraphQL::ExecutionError.new("User not registered on this application")
    end
  end
end
