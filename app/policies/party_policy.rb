class PartyPolicy < ApplicationPolicy
  class Scope < Scope

  def resolve
    scope.all
  end

  def new
    create?
  end

  def create?
    return true
  end

  end
end
