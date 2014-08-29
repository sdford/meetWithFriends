class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :end
      t.string :location
      t.string :location_coord
      t.text :description

      t.timestamps
    end
  end
end
