class UserPolicy < ApplicationPolicy
  class UserPolicy < ApplicationPolicy
    def index?
      user.admin?
    end

    def show?
      user.admin? || record == user
    end

    def update?
      user.admin? || record == user
    end

    def destroy?
      user.admin? && user != record
    end
  end

  class VehiclePolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      user.admin?
    end

    def update?
      user.admin?
    end

    def destroy?
      user.admin?
    end
  end

end
