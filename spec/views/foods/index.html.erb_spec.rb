require 'rails_helper'

RSpec.describe "foods/index", type: :view do
  before(:each) do

    @test_user = User.new(name: 'test', email:'test@gmail', password:'123456')
    @test_user.save!
    sign_in @test_user 
    assign(:foods, [
      Food.create!(
        name: "Name",
        measurement_unit: "Measurement Unit",
        price: "9.99",
        user: @test_user
      ),
      Food.create!(
        name: "Name",
        measurement_unit: "Measurement Unit",
        price: "9.99",
        user: @test_user
      )
    ])
  end

  it "renders a list of foods" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Measurement Unit".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
