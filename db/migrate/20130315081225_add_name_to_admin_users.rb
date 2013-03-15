class AddNameToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :position, :string
  end
end
