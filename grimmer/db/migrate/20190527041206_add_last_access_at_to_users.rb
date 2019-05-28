class AddLastAccessAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_access_at, :datetime
  end
end
