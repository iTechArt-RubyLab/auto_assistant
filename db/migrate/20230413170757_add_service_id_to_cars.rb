class AddServiceIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :service_id, :integer
  end
end
