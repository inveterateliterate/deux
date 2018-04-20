class CreateDayResistanceExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :day_resistance_exercises do |t|
      t.references :day, foreign_key: true
      t.references :resistancable, polymorphic: true, index: { name: 'resistance_index' }
      t.boolean :completed, :boolean, default: false

      t.timestamps
    end
  end
end
