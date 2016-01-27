class RenameDeadlineToTermFromPrices < ActiveRecord::Migration
  def change
    rename_column :prices, :deadline, :term
  end
end
