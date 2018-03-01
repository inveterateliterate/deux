class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.integer :num
      t.string :status

      t.timestamps
    end
  end
end
