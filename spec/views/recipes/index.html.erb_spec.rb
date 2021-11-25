require 'rails_helper'


RSpec.describe "recipes/index/", type: :system do

  before(:each) do
    @test_user = User.new(name: 'test', email:'test616@gmail', password:'123456')
    @test_user.save!
    # sign_in @test_user 
    assign(:recipes, [
      Recipe.create!(
        name: "Name2",
        preparation_time: "9.99",
        cooking_time: "9.99",
        description: "MyText",
        public: false,
        user: @test_user
      ),
      Recipe.create!(
        name: "Name1",
        preparation_time: "9.99",
        cooking_time: "9.99",
        description: "MyText",
        public: false,
        user: @test_user
      )
    ])
  end

  it "renders a list of recipes" do
    visit user_recipes_path(@test_user)
    expect(page).to have_selector('td', text: 'Name2') 
    
    # assert_select "tr>td", text: "Name".to_s, count: 2
    # assert_select "tr>td", text: "9.99".to_s, count: 2
    # assert_select "tr>td", text: "9.99".to_s, count: 2
    # assert_select "tr>td", text: "MyText".to_s, count: 2
    # assert_select "tr>td", text: false.to_s, count: 2
  end
end
