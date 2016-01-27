class CreateDevolutionReceipts < ActiveRecord::Migration
  def change
    create_table :devolution_receipts do |t|

      t.timestamps null: false
    end
  end
end
