class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, all, user: user

    return unless user.is? :admin

    can :manage, :all
  end
end
