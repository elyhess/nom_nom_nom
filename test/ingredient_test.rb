require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
class IngredientTest < Minitest::Test

  def test_it_exists_and_has_attributes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    assert_equal "Cheese", ingredient1.name
    assert_equal "oz", ingredient1.unit
    assert_equal 50, ingredient1.calories
  end

end