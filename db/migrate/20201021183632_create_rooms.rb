class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :anyone_can_join
      t.integer :creator_id
      t.integer :team_id
      t.boolean :hidden

      t.timestamps
    end
  end
end
