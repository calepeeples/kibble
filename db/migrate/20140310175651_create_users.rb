class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :tel
      t.date :birthday
      t.string :ssn

      t.timestamps
    end
  end
end
