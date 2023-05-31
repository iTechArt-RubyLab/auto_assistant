class AddServiceIdToTaggables < ActiveRecord::Migration[7.0]
  def change
    add_column :taggables, :service_id, :integer
  end
end
