class Mutations::Team::DeleteTeam < Mutations::BaseMutation
  argument :id, ID, required: true

  field :team, Types::TeamType, null: true

  def resolve(args)
    begin
      raise Pundit::NotAuthorizedError unless TeamPolicy.new(context[:current_user], null).destroy?
      team = Team.find(args[:id])
      team.destroy!
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
