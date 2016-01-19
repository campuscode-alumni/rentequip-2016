class RemoveToolsGroupFromPrices < ActiveRecord::Migration
  def change
    remove_column :prices, :tools_group, :string
  end
end
