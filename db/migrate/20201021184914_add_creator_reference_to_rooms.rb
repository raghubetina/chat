class AddCreatorReferenceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rooms, :users, column: :creator_id
    add_index :rooms, :creator_id
  end
end
