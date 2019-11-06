class Mutations::Team::CreateTeam < Mutations::BaseMutation
  argument :name, String, required: true
  argument :group_id, ID, required: true

  field :team, Types::TeamType, null: true

  def resolve(args)
    begin
      raise Pundit::NotAuthorizedError unless TeamPolicy.new(context[:current_user], args[:group_id]).create?
      Team.create!(name: args[:name], group_user: GroupUser.find_by(group_id: args[:group_id], user: context[:current_user]))
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
