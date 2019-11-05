class Party < ApplicationRecord
  self.primary_key = :uuid

  has_many :politicians
end
