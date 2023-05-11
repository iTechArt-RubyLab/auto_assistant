class SetDefaultServiceIdInUserTableToNull < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :service_id, :integer, default: nil
  end
end
