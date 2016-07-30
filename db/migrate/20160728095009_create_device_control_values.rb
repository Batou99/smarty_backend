class CreateDeviceControlValues < ActiveRecord::Migration
  def change
    create_table :device_control_values do |t|
      t.integer :control_id
      t.integer :device_id
      t.string  :value

      t.timestamps null: false
    end
  end
end
