class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    p 'working here'
    can :read, Food
    can :read, Recipe, public: true

    return unless user.present?
    p 'ashduhaduasdsauhduasdashdsauh'
    can :manage, Recipe, user_id: user.id
    # can :manage, RecipeFood
  end
end
