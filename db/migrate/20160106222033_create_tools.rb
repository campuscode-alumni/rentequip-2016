class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.text :description
      t.string :serial_number
      t.string :tools_group
      t.string :status

      t.timestamps null: false
    end
  end
end
