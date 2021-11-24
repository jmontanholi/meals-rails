class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Food

    return unless user.present?

    can :manage, :all, user: user

    # return unless user.admin?

    # can :manage, :all
  end
end
