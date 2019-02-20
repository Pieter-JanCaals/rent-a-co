class AnimalPolicy < ApplicationPolicy
  def create?
    user.owner
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
