class AddTopicReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :topics
    add_index :messages, :topic_id
    change_column_null :messages, :topic_id, false
  end
end
