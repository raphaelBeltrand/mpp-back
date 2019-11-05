class Activity < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :politician
end
