class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.integer :room_id
      t.string :name

      t.timestamps
    end
  end
end
