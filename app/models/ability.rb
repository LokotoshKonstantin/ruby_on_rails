class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when AdminUser::ADMIN_ROLE
      can :manage, :all
    when AdminUser::AUTHOR_ROLE
      can :read, Post
      can :create, Post
      can :manage, Post.owned(user)
    else
      return
    end
    can :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
  end
end