class Slideshow < ActiveRecord::Base
  has_attached_file :avatar,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public',
    path: ':slideshow/:attachment/:id/:filename'
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
