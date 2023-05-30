class AddAverageRatingToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :average_rating, :float
  end
end
