class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :event, null: false
      t.string :event_value, null: false
      t.references :equipment, null: false
      t.timestamps
    end
  end
end
