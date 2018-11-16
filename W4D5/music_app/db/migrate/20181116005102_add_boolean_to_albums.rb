class AddBooleanToAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :type
    add_column :albums, :live, :boolean, null: false, default: false
  end
end
