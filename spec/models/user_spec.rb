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

  # Not working
  it 'should be able to read recipes' do
    ability = Ability.new(@user1)
    expect(ability).to be_able_to(:read, Recipe.new(user: @user2, public: false))
  end
end




# RSpec.describe User, type: :model do
#   before :each do
#     @user = User.create(name: 'Gabriel',
#                         photo: 'linktophoto',
#                         bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
#       bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
#       bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
#                         post_counter: 0)
#     @user.save
#   end

#   it 'name should be present' do
#     @user.name = nil
#     expect(@user).to_not be_valid
#   end

#   it 'should return not valid with no number value for posts_counter' do
#     @user.post_counter = nil
#     expect(@user).to_not be_valid
#   end

#   it 'should return not valid with negative number' do
#     @user.post_counter = -1
#     expect(@user).to_not be_valid
#   end
# end

# describe 'User' do
#   before :each do
#     @user = User.create(name: 'Gabriel',
#                         photo: 'linktophoto',
#                         bio: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
#     bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla
#     bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
#                         post_counter: 0)
#     @user.save
#   end
#   it 'shoud fail when default user tries to destroy' do
#     @user.role = 'admin'
#     @user.save
#     ability = Ability.new(@user)
#     expect(ability).to be_able_to(:destroy, Post.new(author: @user))
#   end
#   it 'should pass when default user tries to destroy' do
#     @user.role = 'default'
#     @user.save
#     ability = Ability.new(@user)
#     expect(ability).not_to be_able_to(:destroy, Post.new)
#   end
# end
