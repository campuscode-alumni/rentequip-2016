class CreateToolsGroups < ActiveRecord::Migration
  def change
    create_table :tools_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
