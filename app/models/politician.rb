class Politician < ApplicationRecord
  self.primary_key = :uuid
  validates :id_an, uniqueness: true

  belongs_to :party
  has_many :activities

  has_many :politician_teams, dependent: :destroy
  has_many :teams, through: :politician_teams
end
