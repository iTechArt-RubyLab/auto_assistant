class AddServiceNameToWork < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :service_name, :string
  end
end
