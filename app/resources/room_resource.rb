class RoomResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :open_to_public, :boolean

  # Direct associations

  has_many :topics

  # Indirect associations
end
