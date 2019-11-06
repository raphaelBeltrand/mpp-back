class Mutations::Group::DeleteGroup < Mutations::BaseMutation
  argument :id, ID, required: true

  field :group, Types::GroupType, null: true

  def resolve(args)
    begin
      raise Pundit::NotAuthorizedError unless GroupPolicy.new(context[:current_user], null).destroy?
      group = Group.find(args[:id])
      group.destroy!
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
