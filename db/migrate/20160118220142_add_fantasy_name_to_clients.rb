class AddFantasyNameToClients < ActiveRecord::Migration
  def change
    add_column :clients, :fantasy_name, :string
  end
end
