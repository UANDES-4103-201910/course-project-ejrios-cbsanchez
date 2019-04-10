class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :country
      t.string :city
      t.text :biography
      t.string :password

      t.timestamps
    end
  end
end
