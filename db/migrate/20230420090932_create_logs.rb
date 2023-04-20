class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.datetime :oil_change
      t.datetime :water_removal
      t.datetime :cabin_filter_change
      t.datetime :breaks_liquid_change
      t.datetime :freeze_liquid_change
      t.datetime :driving_belt_change
      t.datetime :chain_grm_change
      t.datetime :oil_filter_change
      t.datetime :air_filter_change
      t.string :registration_number
      t.datetime :ensuranse_expiration
      t.datetime :driver_lisence_expiration
      t.datetime :inspection

      t.timestamps
    end
  end
end
