class RemoveToolIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :tool_id, :integer
  end
end
