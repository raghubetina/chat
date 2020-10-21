class Room < ApplicationRecord
  # Direct associations

  belongs_to :team,
             counter_cache: true

  has_many   :topics,
             dependent: :destroy

  belongs_to :creator,
             optional: true,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
