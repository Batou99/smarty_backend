class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.integer :ui_control_id
      t.string  :display_name

      t.timestamps null: false
    end
  end
end
