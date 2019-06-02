class AddLastAccessAtToSuperAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :super_admins, :last_access_at, :datetime
  end
end
