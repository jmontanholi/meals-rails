require 'rails_helper'
require 'cancan/matchers'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user1 = User.create(name: 'Joao', email:'joao@gmail.com', password:'123456')
    @user1.save!
    @food = @user1.foods.create(name:'Apple', measurement_unit:'Unit', price:55)
    @recipe = @user1.recipes.create(name:'apple pie', preparation_time: 1, cooking_time: 1, description: 'something', public: true)
    @recipe_foods = RecipeFood.new(quantity: 8, food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'should not be null' do
    @recipe_foods.food_id = nil
    expect(@recipe_foods).to_not be_valid
  end

  it 'should fail if type is String' do
    @recipe_foods.quantity = 'one'
    expect(@recipe_foods.quantity).to_not be_a(String)
  end

  it 'should pass if type is Numeric' do
    expect(@recipe_foods.quantity).to be_a(Numeric)
  end

  it 'should be valid' do
    @recipe_foods
    expect(@recipe_foods).to be_valid
  end
end
