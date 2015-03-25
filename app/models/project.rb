class Project < ActiveRecord::Base
  has_many :rooms, :dependent => :destroy

  has_attached_file :avatar,
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV["AWS_BUCKET"], :access_key_id => ENV["AWS_ACCESS_KEY"], :secret_access_key => ENV["AWS_SECURITY_KEY"] }
  end


    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
