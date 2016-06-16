class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :pwd, :string
   add_column :users, :soft_delete, :boolean, :default => false
  end
end
