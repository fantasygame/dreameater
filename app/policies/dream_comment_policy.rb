
class DreamCommentPolicy < ApplicationPolicy

  def update?
    user == record.user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
