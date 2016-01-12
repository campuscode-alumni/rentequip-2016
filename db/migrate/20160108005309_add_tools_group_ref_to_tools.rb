class AddToolsGroupRefToTools < ActiveRecord::Migration
  def change
    add_reference :tools, :tools_group, index: true, foreign_key: true
  end
end
