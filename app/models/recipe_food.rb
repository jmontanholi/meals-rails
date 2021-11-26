class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def price
    food = Food.find(food_id)
    quantity * food.price
  end
end
