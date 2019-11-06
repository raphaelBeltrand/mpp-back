class GroupPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    current_user.present?
  end

  def join?
    current_user.present?
  end

  def destroy?
    current_user.present? && object.is_admin(current_user)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
