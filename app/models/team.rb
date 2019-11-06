class Team < ApplicationRecord
  self.primary_key = :uuid

  has_many :politician_teams, dependent: :destroy
  has_many :politicians, through: :politician_teams

  belongs_to :group_user
end
