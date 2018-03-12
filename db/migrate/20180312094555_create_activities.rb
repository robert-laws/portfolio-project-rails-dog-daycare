class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :best_for_size
      t.string :best_for_type
      t.string :energy_usage
      t.boolean :custom, default: false

      t.timestamps
    end
  end
end
