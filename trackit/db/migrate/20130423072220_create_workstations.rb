class CreateWorkstations < ActiveRecord::Migration
  def change
    create_table :workstations do |t|
      t.string :serial
      t.string :name
      t.string :model
      t.string :OS
      t.text :information
      

      t.timestamps
    end
  end
end
