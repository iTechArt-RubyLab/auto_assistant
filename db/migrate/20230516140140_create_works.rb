class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.integer :car_id
      t.string :service_work
      t.datetime :next_appointment

      t.timestamps
    end
  end
end
