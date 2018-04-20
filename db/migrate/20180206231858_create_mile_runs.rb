class CreateMileRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :mile_runs do |t|
      t.string :type
      t.integer :num_times
      t.float :time_per
      t.float :rest_between
w
      t.timestamps
    end
  end
end
