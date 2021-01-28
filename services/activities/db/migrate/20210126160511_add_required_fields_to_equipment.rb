class AddRequiredFieldsToEquipment < ActiveRecord::Migration[6.1]
  def change
    change_column_null :equipment, :name, false
    change_column_null :equipment, :protocol, false
    change_column_null :equipment, :type, false
  end
end
