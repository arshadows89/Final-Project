class CreateMasonries < ActiveRecord::Migration
  def change
    create_table :masonries do |t|
      t.string :size

      t.timestamps null: false
    end
  end
end
