class RoomResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :anyone_can_join, :boolean
  attribute :creator_id, :integer
  attribute :team_id, :integer
  attribute :hidden, :boolean

  # Direct associations

  belongs_to :team

  has_many   :topics

  belongs_to :creator,
             resource: UserResource

  # Indirect associations
end
