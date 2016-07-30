class AddValidValuesAndDefaultTypeToUiControls < ActiveRecord::Migration
  def change
    add_column :ui_controls, :values, :text
    add_column :ui_controls, :default_value, :string
  end
end
