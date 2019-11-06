class Mutations::Team::UpdatePolitician < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :old_politician_id, ID, required: true
  argument :new_politician_id, ID, required: true

  field :team, Types::TeamType, null: true

  def resolve(args)
    begin
      team = Team.find(args[:id])
      old_politician = team.politician_teams.find_by(politician_id: args[:old_politician_id])
      new_politician = Politician.find(args[:new_politician_id])
      raise Pundit::NotAuthorizedError unless TeamPolicy.new(context[:current_user], team).update?
      old_politician.destroy
      PoliticianTeam.create!(politician: new_politician, team: team)
      team
    rescue e
      GraphQL::ExecutionError.new(e)
    end
  end
end
