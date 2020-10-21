class Topic < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :destroy

  belongs_to :room

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    room.to_s
  end

end
