class PartyPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
  end

  def new
    create?
  end

  def create?
    return true
  end

  def show?
    record.users.include?(user)
  end
end
