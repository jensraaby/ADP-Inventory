class CreateMobiles < ActiveRecord::Migration
  def change
    create_table :mobiles do |t|
      t.string :serial
      t.string :name
      t.string :model
      t.string :OS
      t.string :IMEI
      t.string :ICCID
      t.string :phone_number
      t.text :information

      t.timestamps
    end
  end
end
