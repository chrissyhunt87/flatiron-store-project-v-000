class AddOrdersToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :order_id, :integer, :default => nil
  end
end
