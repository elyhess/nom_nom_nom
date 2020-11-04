require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/ingredient'
require_relative '../lib/recipe'
require_relative '../lib/cook_book'

class CookBookTest < Minitest::Test

  def test_it_exists_and_has_attributes
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    assert_instance_of CookBook, cookbook
    assert_equal [], cookbook.recipes
  end

  def test_it_adds_recipes
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    assert_equal [recipe1, recipe2], cookbook.recipes
  end

  def test_it_lists_ingredients
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)

    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)

    expected = ["Cheese", "Macaroni", "Ground Beef", "Bun"]
    assert_equal expected, cookbook.ingredients
  end

end