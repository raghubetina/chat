class Membership < ApplicationRecord
  # Direct associations

  belongs_to :team,
             counter_cache: true

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
