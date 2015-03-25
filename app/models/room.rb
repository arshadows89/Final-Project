class Room < ActiveRecord::Base
	belongs_to :project
	has_many :pictures

	validates_presence_of :name, :path_width

end
