class AllowNullInUsersAsServiceId < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :service_id, :bigint, null: true
  end
end
