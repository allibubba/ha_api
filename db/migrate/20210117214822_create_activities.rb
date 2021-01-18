class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :operation
      t.references :equipment
      t.timestamps
    end
  end
end
