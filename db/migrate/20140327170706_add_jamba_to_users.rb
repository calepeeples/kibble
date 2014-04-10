class AddJambaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jamba, :boolean, default: false
  end
end
