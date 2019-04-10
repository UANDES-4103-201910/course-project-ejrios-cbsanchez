class CreateSuperAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :super_admins do |t|
      t.string :name
      t.string :password
      t.string :nickname
      t.string :email
      t.string :e_password

      t.timestamps
    end
  end
end
