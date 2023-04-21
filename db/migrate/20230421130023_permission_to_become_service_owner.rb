class PermissionToBecomeServiceOwner < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :permission_to_become_service_owner, :boolean, default: false
  end
end
