require 'rails_helper'

RSpec.describe "foods/show", type: :view do
  before(:each) do
    @test_user = User.new(name: 'test', email:'test@gmail', password:'123456')
    @test_user.save!
    sign_in @test_user 
    @food = assign(:food, Food.create!(
      name: "Name",
      measurement_unit: "Measurement Unit",
      price: "9.99",
      user: @test_user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Measurement Unit/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
