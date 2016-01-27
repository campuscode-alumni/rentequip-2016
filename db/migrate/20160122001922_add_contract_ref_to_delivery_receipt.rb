class AddContractRefToDeliveryReceipt < ActiveRecord::Migration
  def change
    add_reference :delivery_receipts, :contract, index: true, foreign_key: true
  end
end
