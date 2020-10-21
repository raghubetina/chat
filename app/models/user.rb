class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end
