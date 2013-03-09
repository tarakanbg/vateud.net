class AddNameToPages < ActiveRecord::Migration
  def change
    add_column :pages, :name, :string
    add_index :pages, :slug, :unique => true
  end
end
