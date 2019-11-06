class Mutations::Group::JoinGroup < Mutations::BaseMutation
  argument :id, ID, required: true

  field :group, Types::GroupType, null: true

  def resolve(args)
    begin
      raise Pundit::NotAuthorizedError unless GroupPolicy.new(context[:current_user], null).join?
      group = Group.find(args[:id])
      GroupUser.create!(user: context[:current_user], group: group)
      group
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
