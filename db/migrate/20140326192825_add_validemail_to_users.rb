class AddValidemailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :validemail, :boolean, default: false
  end
end
