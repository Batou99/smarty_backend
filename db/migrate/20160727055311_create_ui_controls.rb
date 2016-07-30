class CreateUiControls < ActiveRecord::Migration
  def change
    create_table :ui_controls do |t|
      t.string :kind, null: false
      t.timestamps null: false
    end
  end
end
