class RemoveServiceFromCarTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :service_id
  end
end
