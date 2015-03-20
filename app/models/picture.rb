class Picture < ActiveRecord::Base

  belongs_to :gallery

    has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public'
    path: ':class/:attachment/:id/:filename'

  do_not_validate_attachment_file_type :image
end
