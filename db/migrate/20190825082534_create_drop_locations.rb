class CreateDropLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :drop_locations do |t|
      t.references :booking, foreign_key: true
      t.string :address
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.timestamps
    end
  end
end
