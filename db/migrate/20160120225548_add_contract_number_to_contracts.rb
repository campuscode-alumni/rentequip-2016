class AddContractNumberToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :contract_number, :string
  end
end
