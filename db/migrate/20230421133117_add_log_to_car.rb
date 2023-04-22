class AddLogToCar < ActiveRecord::Migration[7.0]
  def change

    add_column :logs, :car_id, :integer

  end
end
