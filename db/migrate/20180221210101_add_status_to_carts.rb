class AddStatusToCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :submitted, :boolean, :default => false
    add_column :carts, :status, :string, :default => "open"
  end
end
