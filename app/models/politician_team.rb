class PoliticianTeam < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :politician
  belongs_to :team
end
