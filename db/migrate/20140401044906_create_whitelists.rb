class CreateWhitelists < ActiveRecord::Migration
  def change
    create_table :whitelists do |t|
      t.string :fname
      t.string :lname
      t.integer :user_id
      t.string :email
      t.integer :ssn

      t.timestamps
    end
  end
end
