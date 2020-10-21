class TopicResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :room_id, :integer
  attribute :name, :string

  # Direct associations

  has_many   :messages

  belongs_to :room

  # Indirect associations
end
