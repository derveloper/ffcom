class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    logged_in = !user.id.nil?

    if user.has_role? :admin
      can :manage, :all
    end

    if logged_in
      can :read, :user
      can :index, :user
      can :manage, Node do |node|
        node.user_id == user.id
      end
    end
  end
end
