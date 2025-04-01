class AddApprovedToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :approved, :boolean
  end
end
