class Mutations::RegisterUser < Mutations::BaseMutation
  argument :name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true

  def resolve(args)
    begin
      @user = User.create!(name: args[:name], password: args[:password], email: args[:email])
      return { user: @user }
    rescue ActiveRecord::RecordInvalid => invalid
      GraphQL::ExecutionError.new("Invalid Attributes for #{invalid.record.class.name}: #{invalid.record.errors.full_messages.join(", ")}")
    end
  end
end
