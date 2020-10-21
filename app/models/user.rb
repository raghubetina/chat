class User < ApplicationRecord
  # Direct associations

  has_many   :memberships,
             dependent: :destroy

  has_many   :rooms,
             foreign_key: "creator_id",
             dependent: :nullify

  has_many   :messages,
             dependent: :nullify

  # Indirect associations

  has_many   :teams,
             through: :memberships,
             source: :team

  # Validations

  # Scopes

  def to_s
    username
  end
end
