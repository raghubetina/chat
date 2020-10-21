class AddTeamReferenceToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :memberships, :teams
    add_index :memberships, :team_id
    change_column_null :memberships, :team_id, false
  end
end
