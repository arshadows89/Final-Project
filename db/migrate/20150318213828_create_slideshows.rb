class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|

      t.timestamps null: false
    end
  end
end
