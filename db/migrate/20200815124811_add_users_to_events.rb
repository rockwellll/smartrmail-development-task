class AddUsersToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :users, :string
  end
end
