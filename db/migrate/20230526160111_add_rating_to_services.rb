class AddRatingToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :rating, :integer
  end
end
