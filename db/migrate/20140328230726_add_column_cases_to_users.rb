class AddColumnCasesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cases, :boolean, default: false
  end
end
