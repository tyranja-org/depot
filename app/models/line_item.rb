class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    price * quantity
  end

  def decrement_quantity(line_item_id)
    current_item = LineItem.find_by_id(line_item_id)

    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end

    current_item
  end

end
