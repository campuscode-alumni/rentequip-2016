class CreateDeliveryReceipts < ActiveRecord::Migration
  def change
    create_table :delivery_receipts do |t|

      t.timestamps null: false
    end
  end
end
