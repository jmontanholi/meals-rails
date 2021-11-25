require 'rails_helper'

RSpec.describe "foods/new", type: :view do
  before(:each) do

    @test_user = User.new(name: 'test', email:'test@gmail', password:'123456')
    @test_user.save!
    sign_in @test_user 
    assign(:food, Food.new(
      name: "MyString",
      measurement_unit: "MyString",
      price: "9.99",
      user: @test_user
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", foods_path, "post" do

      assert_select "input[name=?]", "food[name]"

      assert_select "input[name=?]", "food[price]"
    end
  end
end
