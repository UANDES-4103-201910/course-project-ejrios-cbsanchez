class CreateLocationAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :location_admins do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :adminstrator, foreign_key: true

      t.timestamps
    end
  end
end
