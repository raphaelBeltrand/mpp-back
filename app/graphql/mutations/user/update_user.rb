class Mutations::User::UpdateUser < Mutations::BaseMutation
  argument :name, ID, required: false
  argument :email, ID, required: false

  field :user, Types::UserType, null: true

  def resolve(args)
    begin
      user = context[:current_user]
      user.update!(name: args[:name].present? ? args[:name] : user.name,
        email: args[:email].present? ? args[:email] : user.email)
      # raise Pundit::NotAuthorizedError unless UserPolicy.new(context[:current_user]).update?
      user
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
