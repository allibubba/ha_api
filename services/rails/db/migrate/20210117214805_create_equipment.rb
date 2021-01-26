class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :type
      t.string :name
      t.string :brand
      t.integer :protocol
      t.belongs_to :location, foreign_key: true
      t.timestamps
    end
  end
end
