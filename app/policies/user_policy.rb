class UserPolicy < ApplicationPolicy

  def become_owner?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
