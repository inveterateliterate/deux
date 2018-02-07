class CreateSpeedTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :speed_trainings do |t|
      t.integer :num_times
      t.string :distance
      t.integer :rep_seconds_rest
      t.integer :round_seconds_rest
      t.integer :round_order

      t.timestamps
    end
  end
end
