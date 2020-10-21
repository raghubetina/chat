class Team < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             dependent: :destroy

  has_many   :rooms,
             dependent: :destroy

  # Indirect associations

  has_many   :users,
             through: :memberships,
             source: :user

  # Validations

  # Scopes

  def to_s
    name
  end
end
