class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.integer :quantity
      t.integer :category_id
    end
  end
end
