class Mutations::Team::AddPolitician < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :politician_id, ID, required: true

  field :team, Types::TeamType, null: true

  def resolve(args)
    begin
      team = Team.find(args[:id])
      raise Pundit::NotAuthorizedError unless TeamPolicy.new(context[:current_user], team).add_politician?
      PoliticianTeam.create!(politician_id: args[:politician_id], team: team)
      team
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
