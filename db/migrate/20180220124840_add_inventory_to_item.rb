class AddInventoryToItem < ActiveRecord::Migration
  def change
    remove_column :items, :quantity, :integer
    add_column :items, :inventory, :integer
  end
end
