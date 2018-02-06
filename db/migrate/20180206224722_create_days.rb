class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.integer :day_index
      t.references :week, foreign_key: true, index: true

      t.timestamps
    end
  end
end
