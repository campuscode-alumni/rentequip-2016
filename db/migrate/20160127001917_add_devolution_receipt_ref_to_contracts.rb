class AddDevolutionReceiptRefToContracts < ActiveRecord::Migration
  def change
    add_reference :devolution_receipts, :contract, index: true, foreign_key: true
  end
end
