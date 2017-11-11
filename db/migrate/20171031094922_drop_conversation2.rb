class DropConversation2 < ActiveRecord::Migration
  def change
    drop_table :conversations
  end
end
