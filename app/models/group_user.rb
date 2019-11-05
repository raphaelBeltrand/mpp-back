class GroupUser < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :group
  belongs_to :user

  has_many :teams, dependent: :destroy
end
