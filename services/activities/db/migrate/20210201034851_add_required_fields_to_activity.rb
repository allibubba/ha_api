class AddRequiredFieldsToActivity < ActiveRecord::Migration[6.1]
  def change
    change_column_null :activities, :equipment_id, false
    change_column_null :activities, :event_value, false
    change_column_null :activities, :event_type, false
  end
end
