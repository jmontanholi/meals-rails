# require 'rails_helper'

# RSpec.describe "recipe_foods/index", type: :view do
#   before(:each) do
#     assign(:recipe_foods, [
#       RecipeFood.create!(
#         quantity: "9.99",
#         recipe: nil,
#         food: nil
#       ),
#       RecipeFood.create!(
#         quantity: "9.99",
#         recipe: nil,
#         food: nil
#       )
#     ])
#   end

#   it "renders a list of recipe_foods" do
#     render
#     assert_select "tr>td", text: "9.99".to_s, count: 2
#     assert_select "tr>td", text: nil.to_s, count: 2
#     assert_select "tr>td", text: nil.to_s, count: 2
#   end
# end
