class Masonry < ActiveRecord::Base
  has_attached_file :avatar,
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => "greenwich-development-group", :access_key_id => "AKIAJZ2WHEZZLMP2B2HA", :secret_access_key => "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"}
  end


    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

