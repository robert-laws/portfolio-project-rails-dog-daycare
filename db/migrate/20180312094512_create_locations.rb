class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :city
      t.integer :capacity
      t.integer :size
      t.integer :open_year

      t.timestamps
    end
  end
end
