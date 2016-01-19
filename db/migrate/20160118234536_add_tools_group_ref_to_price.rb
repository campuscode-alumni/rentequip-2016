class AddToolsGroupRefToPrice < ActiveRecord::Migration
  def change
    add_reference :prices, :tools_group, index: true, foreign_key: true
  end
end
