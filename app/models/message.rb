class Message < ApplicationRecord
  # Direct associations

  belongs_to :topic

  belongs_to :user,
             optional: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    topic.to_s
  end
end
