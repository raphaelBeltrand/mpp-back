class Mutations::Group::CreateGroup < Mutations::BaseMutation
  argument :name, String, required: true
  argument :public, Boolean, required: true

  field :group, Types::GroupType, null: true

  def resolve(args)
    begin
      raise Pundit::NotAuthorizedError unless GroupPolicy.new(context[:current_user], null).create?
      group = Group.create!(name: args[:name], public: args[:public])
      GroupUser.create!(user: context[:current_user], group: group, is_admin: true)
      group
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
