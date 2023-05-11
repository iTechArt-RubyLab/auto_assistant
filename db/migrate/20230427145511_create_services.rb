class CreateServices < ActiveRecord::Migration[7.0]
  def change
    change_column :services, :contact, :string, null: true
  end
end
