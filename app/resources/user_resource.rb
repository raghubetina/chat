class UserResource < ApplicationResource
  secondary_endpoint "/current_user", [:show]
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many   :memberships

  has_many   :rooms,
             foreign_key: :creator_id

  has_many   :messages

  # Indirect associations
end
