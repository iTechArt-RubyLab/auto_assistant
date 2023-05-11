class RequestServiceOwner < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :request_service_owner, :boolean, default: false
  end
end
