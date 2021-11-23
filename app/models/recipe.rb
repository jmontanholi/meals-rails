class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

 def foods_count
    foods.count
  end

  def total_price
    foods.sum(:price)
  end
end
