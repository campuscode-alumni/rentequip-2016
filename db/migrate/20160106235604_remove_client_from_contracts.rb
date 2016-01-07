class RemoveClientFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :client, :string
  end
end
