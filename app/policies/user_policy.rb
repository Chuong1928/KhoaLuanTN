class UserPolicy < ApplicationPolicy
    attr_reader :user, :scope

    def initialize user, scope
        @user = user
        @scope = scope
    end

    class Scope < Scope
        def resolve
            if user.role == "super_admin"
               scope.all
            else
                scope.where(user_id: user.id)
            end
        end
    end

    def edit?
        scope.user_id == user.id   
    end

    def update?
        scope.user_id == user.id  || user.role == "super_admin" 
    end

    def destroy?
        scope.user_id == user.id 
    end

    def show?
        scope.user_id == user.id  || user.role == "super_admin" 
    end
end