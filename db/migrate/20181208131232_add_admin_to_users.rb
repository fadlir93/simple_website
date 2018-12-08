class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adimin, :boolean, default: false
  end
end
