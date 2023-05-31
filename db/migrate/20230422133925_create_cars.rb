class CreateCars < ActiveRecord::Migration[7.0]
  def change
    change_column :cars , :engine_size, 'integer USING CAST(engine_size AS integer)'
  end
end
