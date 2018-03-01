class AddWeekReferenceToDays < ActiveRecord::Migration[5.1]
  def change
    add_reference :days, :week, foreign_key: true, index: true
    remove_column :days, :week_num, :integer
  end
end
