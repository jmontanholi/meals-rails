module RecipeFoodsHelper
  def food_count(recipes)
    food_count = 0
    recipes.each do |recipe|
      food_count += recipe.foods.count
    end
    food_count
  end

  def price_count(recipes)
    price_count = 0
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipefood|
        price_count += recipefood.price
      end
    end
    price_count
  end

  def recipe_foods(recipes)
    recipe_foods = []
    recipes.each do |recipe|
      recipe.recipe_foods.each do |recipefood|
        recipe_foods << recipefood
      end
    end
    recipe_foods
  end
end
