class Mutations::Team::UpdateTeamName < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: true

  field :team, Types::TeamType, null: true

  def resolve(args)
    begin
      team = Team.find(args[:id])
      raise Pundit::NotAuthorizedError unless TeamPolicy.new(context[:current_user], team).update?
      team.update!(name: args[:name])
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
