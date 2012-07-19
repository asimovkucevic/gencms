class AdminAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # We operate with three role levels:
    #  - Editor
    #  - Moderator
    #  - Manager

    # An editor can do the following:
#    can :manage, Foobar
#    can :read, SomeOtherModel

    # A moderator can do the following:
    if user.role? :super_admin
      can :manage, User
    end

    # A manager can do the following:
    if user.role? :product_admin
      can :read, User
    end
  end
end