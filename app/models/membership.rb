class Membership < ApplicationRecord
  enum role: { "member" => 0, "owner" => 1 }

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
