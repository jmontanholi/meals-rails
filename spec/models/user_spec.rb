require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  before :each do
    @user1 = User.create(name: 'Joao')
    @user1.save
    @user2 = User.create(name: 'Gabriel')
    @user2.save
  end
  
  it 'should not be null' do
    @user1.name = nil
    expect(@user1).to_not be_valid
  end

  it 'should pass if type is String' do
    @user1.name = 'Joao'
    expect(@user1.name).to be_a(String)
  end

  it 'should fail if type is Numeric' do
    @user1.name = 0
    expect(@user1.name).not_to be_a(Numeric)
  end

  it 'should be able to read recipes' do
    test_user = User.new(name: 'test', email:'test@gmail', password:'123456')
    test_user.save!
    ability = Ability.new(test_user)
    expect(ability).to be_able_to(:read, Recipe.new(user: @user2, public: true))
  end
end
