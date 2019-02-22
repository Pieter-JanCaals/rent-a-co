class BookingPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def confirm_booking?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
