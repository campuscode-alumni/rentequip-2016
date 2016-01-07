class ContractsTools < ActiveRecord::Migration
  def change
    create_table :contracts_tools do |t|
      t.integer :contract_id
      t.integer :tool_id
    end

    add_index :contracts_tools, :contract_id
  end
end
