class CreateSuicides < ActiveRecord::Migration[5.1]
  def change
    create_table :suicides do |t|
      t.integer :num_times
      t.integer :int_yds
      t.integer :int_times
      t.integer :round_minutes_rest

      t.timestamps
    end
  end
end
