class CreateLocationActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :location_activities do |t|
      t.belongs_to :location, foreign_key: true
      t.belongs_to :activity, foreign_key: true

      t.timestamps
    end
  end
end
