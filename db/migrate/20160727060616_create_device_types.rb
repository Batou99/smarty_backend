class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string  :name
      t.integer :device_type_control_association

      t.timestamps null: false
    end
  end
end
