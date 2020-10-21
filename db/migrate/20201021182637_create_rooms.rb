class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :open_to_public

      t.timestamps
    end
  end
end
