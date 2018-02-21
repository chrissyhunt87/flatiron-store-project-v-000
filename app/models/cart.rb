class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    
    self.line_items.each do |line_item|
      line_item_total = line_item.quantity * line_item.item.price
      total += line_item_total
    end

    return total
  end

  def add_item(item_id)
    line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)

    if line_item != nil
      line_item.update(quantity: line_item.quantity+1)
    else
      line_item = LineItem.new(item_id: item_id, cart_id: self.id)
    end

    return line_item
  end

end
