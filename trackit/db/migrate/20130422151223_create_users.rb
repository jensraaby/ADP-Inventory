class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :sAMAccountName
      t.string :userPrincipalName
      t.string :mail
      t.string :givenName
      t.string :sn
      t.string :displayName
      t.string :telephoneNumber
      t.boolean :active

      t.timestamps
    end
  end
end
