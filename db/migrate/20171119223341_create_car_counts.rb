class CreateCarCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :car_counts do |t|

      t.timestamps
    end
  end
end
