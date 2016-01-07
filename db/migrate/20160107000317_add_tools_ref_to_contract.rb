class AddToolsRefToContract < ActiveRecord::Migration
  def change
    add_reference :contracts, :tool, index: true, foreign_key: true
  end
end
