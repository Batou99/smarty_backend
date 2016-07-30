class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string  :name, null: false
      t.string  :ip_address
      t.integer :device_type_id, null: false

      t.timestamps null: false
    end
  end
end
