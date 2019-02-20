class AnimalPolicy < ApplicationPolicy
  def create?
    user.owner
  end

  def show?
    true
  end

  def index?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
