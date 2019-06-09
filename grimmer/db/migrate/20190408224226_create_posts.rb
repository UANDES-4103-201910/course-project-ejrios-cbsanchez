class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.string :type
      t.string :country
      t.string :city
      t.string  :photo
      t.string :file

      t.timestamps
    end
  end
end
