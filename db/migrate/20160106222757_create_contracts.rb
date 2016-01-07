class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :client
      t.string :equipment
      t.integer :term
      t.date :initial_date
      t.date :deadline
      t.float :total_price
      t.string :delivery_address
      t.string :responsable

      t.timestamps null: false
    end
  end
end
