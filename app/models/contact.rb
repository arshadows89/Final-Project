class Contact < ActiveRecord::Base
  validates :address, :street_address, :phone_number, :email, presence: true

end
