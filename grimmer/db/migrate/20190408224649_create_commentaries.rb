class CreateCommentaries < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaries do |t|
      t.text :texto
      t.string :country
      t.string :city
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :photo
      t.string :file
      t.string :location

      t.timestamps
    end
  end
end
