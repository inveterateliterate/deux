class AddStatusToDayRunningExercise < ActiveRecord::Migration[5.1]
  def change
    add_column :day_running_exercises, :completed, :boolean, default: false
  end
end
