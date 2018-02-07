class CreateDayRunningExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :day_running_exercises do |t|
      t.references :day, foreign_key: true
      t.references :runnable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
