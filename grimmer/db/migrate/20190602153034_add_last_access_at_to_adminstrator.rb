class AddLastAccessAtToAdminstrator < ActiveRecord::Migration[5.2]
  def change
    add_column :adminstrators, :last_access_at, :datetime
  end
end
