class AddAttachmentAvatarToMasonries < ActiveRecord::Migration
  def self.up
    change_table :masonries do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :masonries, :avatar
  end
end
