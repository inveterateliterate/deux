class CreateCircuitExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :circuit_exercises do |t|
      t.hstore :exercises
      t.string :type
      t.timestamps
    end
  end
end
