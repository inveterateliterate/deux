class AddOrdertoCircuitExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :circuit_exercises, :order, :integer
  end
end
