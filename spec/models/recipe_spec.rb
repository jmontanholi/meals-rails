require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Recipe, type: :model do
  before :each do
    @user1 = User.create(name: 'Joao', email:'joao@gmail.com', password:'123456')
    @user1.save!
    @food = @user1.foods.create(name:'Apple', measurement_unit:'Unit', price:55)
    @recipe = Recipe.new(name:'apple pie', preparation_time: 1, cooking_time: 1, description: 'something', public: true)
  end

  it 'User should not be null' do
    expect(@recipe).to_not be_valid
  end

  it 'preparation_time should fail if type is String' do
    @recipe.preparation_time = 'one'
    expect(@recipe.preparation_time).to_not be_a(String)
  end

  it 'preparation_time should pass if type is Numeric' do
    expect(@recipe.preparation_time).to be_a(Numeric)
  end

  it 'cooking_time should fail if type is String' do
    @recipe.cooking_time = 'one'
    expect(@recipe.cooking_time).to_not be_a(String)
  end

  it 'cooking_time should pass if type is Numeric' do
    expect(@recipe.cooking_time).to be_a(Numeric)
  end

  it 'should be valid' do
    @recipe.user_id = @user1.id
    expect(@recipe).to be_valid
  end
end
