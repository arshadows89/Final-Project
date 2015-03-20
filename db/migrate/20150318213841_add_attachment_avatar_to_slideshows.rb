class AddAttachmentAvatarToSlideshows < ActiveRecord::Migration
  def self.up
    change_table :slideshows do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :slideshows, :avatar
  end
end
