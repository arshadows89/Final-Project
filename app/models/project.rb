class Project < ActiveRecord::Base
  has_many :rooms

  has_attached_file :avatar,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public',
    path: ':project/:attachment/:id/:filename'
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
