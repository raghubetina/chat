class Room < ApplicationRecord
  # Direct associations

  has_many   :topics,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
