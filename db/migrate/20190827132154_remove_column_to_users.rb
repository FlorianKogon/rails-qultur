class RemoveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :coins
  end
end