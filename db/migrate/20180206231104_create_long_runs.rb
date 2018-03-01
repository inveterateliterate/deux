class CreateLongRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :long_runs do |t|
      t.integer :amt_time

      t.timestamps
    end
  end
end
