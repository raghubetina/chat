class AddTeamReferenceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rooms, :teams
    add_index :rooms, :team_id
    change_column_null :rooms, :team_id, false
  end
end
