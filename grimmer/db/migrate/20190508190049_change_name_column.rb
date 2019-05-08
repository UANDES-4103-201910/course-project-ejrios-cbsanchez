class ChangeNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :type_of_post
  end
end
