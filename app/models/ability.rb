class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :product_admin
      can :manage, User   # [Product, Asset, Issue]
    elsif user.role? :product_team
      can :read, User   # [Product, Asset]
      # manage products, assets he owns
      can :manage, User do |product|
        product.try(:owner) == user
      end
      # can :manage, Asset do |asset|
      #   asset.assetable.try(:owner) == user
      # end
    end

    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
  end
end
