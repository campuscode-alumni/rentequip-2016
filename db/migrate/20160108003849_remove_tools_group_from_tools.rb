class RemoveToolsGroupFromTools < ActiveRecord::Migration
  def change
    remove_column :tools, :tools_group, :string
  end
end
