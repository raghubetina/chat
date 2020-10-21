class AddMembershipCountToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :memberships_count, :integer
  end
end
