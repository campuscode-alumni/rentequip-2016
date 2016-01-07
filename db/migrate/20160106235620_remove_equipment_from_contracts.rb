class RemoveEquipmentFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :equipment, :string
  end
end
