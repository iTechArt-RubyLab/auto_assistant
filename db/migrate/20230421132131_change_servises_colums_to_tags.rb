class ChangeServisesColumsToTags < ActiveRecord::Migration[7.0]
  def change
    change_column :services, :service_type, :text, array: true, default: [], using: "(string_to_array(service_type, ','))"
  end

end
