class CreateAdminstrators < ActiveRecord::Migration[5.2]
  def change
    create_table :adminstrators do |t|
      t.string :name
      t.string :password
      t.string :nickname
      t.string :email
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
