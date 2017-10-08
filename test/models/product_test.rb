require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product is not valid without unique title" do
    product = Product.new(title: products(:ruby).title,
              description: "yyy",
              price: 1,
              image_url: "fred.gif")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product title has a length greater than 10" do
    product = products(:ruby)
    product.title = "four"
    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]
  end
end
