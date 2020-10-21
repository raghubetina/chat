class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :topic_id, :integer
  attribute :body, :string
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
