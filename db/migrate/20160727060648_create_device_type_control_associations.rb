class CreateDeviceTypeControlAssociations < ActiveRecord::Migration
  def change
    create_table :device_type_control_associations do |t|
      t.integer :device_type_id
      t.integer :control_id

      t.timestamps null: false
    end
  end
end
