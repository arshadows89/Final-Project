class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :street_address

      t.timestamps null: false
    end
  end
end
