class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :device_type
      t.integer :device_id
      t.integer :user_id
      t.boolean :active
      
      t.timestamps
    end
  end
end
