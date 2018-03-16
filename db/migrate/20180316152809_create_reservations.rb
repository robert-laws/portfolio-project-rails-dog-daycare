class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :drop_off_time
      t.time :pick_up_time
      t.integer :user_id

      t.timestamps
    end
  end
end
