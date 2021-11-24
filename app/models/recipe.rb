class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

 def foods_count
    foods.count
  end

  def total_price
    price_count = 0
    recipe_foods.each do |recipefood|
      price_count += recipefood.price
    end
    price_count
  end
end
