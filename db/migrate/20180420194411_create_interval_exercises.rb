class CreateIntervalExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :interval_exercises do |t|
      t.hstore :exercises
      t.timestamps
    end
  end
end
