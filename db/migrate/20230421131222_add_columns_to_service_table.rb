class AddColumnsToServiceTable < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :service_type, :string
    add_column :services, :contact, :string
  end
end
