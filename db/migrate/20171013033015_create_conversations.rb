class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :host_id
      t.integer :guest_id

      t.timestamps

      t.index :host_id
      t.index :guest_id
      t.index [:host_id, :guest_id], unique: true
    end
  end
end
