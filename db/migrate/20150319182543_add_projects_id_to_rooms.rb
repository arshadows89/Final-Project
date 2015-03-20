class AddProjectsIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :project_id, :integer
  end
end
