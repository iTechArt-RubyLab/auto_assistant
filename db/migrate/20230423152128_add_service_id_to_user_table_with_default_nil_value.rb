class AddServiceIdToUserTableWithDefaultNilValue < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :service, null: true, foreign_key: true
  end
end
