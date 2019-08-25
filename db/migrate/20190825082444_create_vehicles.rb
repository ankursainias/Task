class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :driver, foreign_key: true
      t.string :plate_number
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
