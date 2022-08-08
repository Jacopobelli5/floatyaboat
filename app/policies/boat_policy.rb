class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # def new?
    # true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
    # if the user is the owner of the boat => true
    # otherwise => false
    # user => current_user
    # record => @boat (argument passed to atuhorize)
    # user == record.user
  # end

  def update?
    user == record.user # conditional returning true or false
  end

  def destroy?
    user == record.user
  end
end
