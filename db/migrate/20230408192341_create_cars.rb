class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :fuel_type
      t.string :engine_size
      t.string :transmission
      t.string :body_type
      t.integer :mileage
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
