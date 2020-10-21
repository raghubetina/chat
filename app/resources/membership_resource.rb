class MembershipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :team_id, :integer
  attribute :role, :integer_enum, allow: Membership.roles.keys

  # Direct associations

  belongs_to :team

  belongs_to :user

  # Indirect associations
end
