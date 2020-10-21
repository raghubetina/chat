class AddRoomReferenceToTopics < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :topics, :rooms
    add_index :topics, :room_id
    change_column_null :topics, :room_id, false
  end
end
