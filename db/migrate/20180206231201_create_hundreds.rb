class CreateHundreds < ActiveRecord::Migration[5.1]
  def change
    create_table :hundreds do |t|
      t.integer :num_times

      t.timestamps
    end
  end
end
