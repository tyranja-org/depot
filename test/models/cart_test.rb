require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add unique products to a cart" do
    cart = Cart.create
    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:coffee)).save!

    assert_equal 2, cart.line_items.count
  end

  test "add same products to a cart" do
    cart = Cart.create
    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:ruby)).save!

    assert_equal 1, cart.line_items.count
  end

end
