class AddDescriptionToToolsGroup < ActiveRecord::Migration
  def change
    add_column :tools_groups, :description, :text
  end
end
