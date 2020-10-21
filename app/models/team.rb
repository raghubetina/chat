class Team < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             dependent: :destroy

  has_many   :rooms,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
