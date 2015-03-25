class Picture < ActiveRecord::Base

  belongs_to :room

    has_attached_file :image,
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => ENV["AWS_BUCKET"], :access_key_id => ENV["AWS_ACCESS_KEY"], :secret_access_key => ENV["AWS_SECURITY_KEY"] }
  end

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
