class AddDatecreateToInappropiates < ActiveRecord::Migration[5.2]
  def change
    add_column :inappropiates, :datecreate, :datetime
  end
end
