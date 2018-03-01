class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.integer :day_index, index: true
      t.integer :week_num, index: true

      t.timestamps
    end
  end
end
