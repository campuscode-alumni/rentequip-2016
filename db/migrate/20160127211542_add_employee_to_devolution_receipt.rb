class AddEmployeeToDevolutionReceipt < ActiveRecord::Migration
  def change
    add_column :devolution_receipts, :employee, :string
  end
end
