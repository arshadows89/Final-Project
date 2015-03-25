class AddRoomIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :room_id, :integer
  	remove_column :pictures, :gallery_token, :string
  	remove_column :pictures, :gallery_id, :integer
  end
end
