class AddPathLeftToRooms < ActiveRecord::Migration
  def change
  	add_column :rooms, :path_height, :string
  	add_column :rooms, :path_width, :string
  	add_column :rooms, :path_top, :string
  	add_column :rooms, :path_left, :string
  	remove_column :rooms, :path, :string
  end
end
